import 'dart:convert';

import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/form/notepad_model.dart';
import 'package:cosnect/src/model/form/survey_model.dart';
import 'package:cosnect/src/provider/coser_provider.dart';
import 'package:cosnect/src/provider/shared_preference_provider.dart';
import 'package:cosnect/src/repository/memo_dao.dart';
import 'package:cosnect/src/repository/memo_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notepad_provider.freezed.dart';
part 'notepad_provider.g.dart';

@freezed
class NotePadState with _$NotePadState {
  const factory NotePadState({
    NotepadModel? currentNote,
    @Default([]) List<NotepadModel> noteList,
  }) = _NotePadState;
}

@Riverpod(keepAlive: true)
class Notepad extends _$Notepad {
  final MemoDao _dao = MemoDao(database);

  @override
  NotePadState build() {
    final int lastId = ref.read(sharedPreferencesProvider).getAppSetting().lastNotepadId;

    fetchNotepadList().then(
      (value) => state = NotePadState(
        currentNote: value.isEmpty ? null : value[lastId],
        noteList: value,
      ),
    );
    return const NotePadState(currentNote: null);
  }

  /// 새로운 메모장 데이터를 추가한다.
  Future<int> addNotepad({
    required String title,
  }) async {
    // Drift에 메모 데이터를 추가한다.
    final id = await _dao.createNotepad(NoteItemsCompanion(
      title: drift.Value(title),
    ));

    // 추가한 메모를 현재 선택된 메모로 설정한다.
    state = state.copyWith(
      currentNote: NotepadModel(id: id, title: title),
      noteList: [...state.noteList, NotepadModel(id: id, title: title)],
    );

    return id;
  }

  /// 현재 선택한 메모장의 정보를 저장한다.
  void setCurrentNotepad(int notepadId) {
    if (state.noteList.isEmpty) {
      return;
    }

    // 입력받은 notepadId에 해당하는 노트패드를 필터링
    final notepad = state.noteList.where((element) => element.id == notepadId).firstOrNull;

    // 다음에 앱을 켰을때 동일한 위치로 이동시키기 위해 로컬저장소에 저장
    final appSetting = ref.read(sharedPreferencesProvider).getAppSetting();
    ref.read(sharedPreferencesProvider).setAppSetting(appSetting.copyWith(
      lastNotepadId: notepadId,
    ));

    state = state.copyWith(
      currentNote: notepad,
    );
  }

  /// Drift에 저장된 전체 메모장 리스트를 받아온다.
  Future<List<NotepadModel>> fetchNotepadList() async {
    final repoList = await _dao.readAllNotepad();
    // Drift에서 받은 데이터를 Model로 변환시킨다.
    final notepadList = repoList.map((e) => NotepadModel.fromItem(e)).toList();
    return notepadList;
  }
}

@riverpod
class MemoList extends _$MemoList {
  final MemoDao _dao = MemoDao(database);

  @override
  List<MemoModel> build() {
    fetchMemoList().then((value) => state = value);
    return [];
  }

  /// Drift에 저장된 메모 리스트들을 가져온다.
  Future<List<MemoModel>> fetchMemoList({int? notepadId}) async {
    final memoList = await _dao.readAllMemo(notepadId: notepadId);

    // Drift 데이터에는 Coser id 와 Notepad의 id 만 저장이 되어있다.
    // id를 기반으로 실질적인 Model 데이터로 변환하기 위해서 각각의 리스트를 받아온다.
    final coserList = ref.read(coserProvider);
    final notepad = ref.read(notepadProvider).currentNote;

    // 위에서 불러온 리스트를 바탕으로 Model 데이터로 변환해준다.
    final memoModelList = memoList.map((e) {
      return MemoModel(
        id: e.id,
        coser: coserList.where((element) => element.id == e.coserId).first,
        notepad: notepad!,
        series: e.series,
        character: e.character,
        isFavorite: e.isFavorite,
        isSent: e.isSent,
        isReturned: e.isReturned,
        label: e.label,
        imageBytes: e.imageBytes,
        survey: e.survey != null ? SurveyModel.fromJson(jsonDecode(e.survey!)) : null,
      );
    }).toList();

    talker.debug('memoList : ${memoModelList.toString()}');

    return memoModelList;
  }

  /// 메모를 추가한다.
  Future<int> addMemo({
    required MemoModel memo,
    required int coserId,
    required int notepadId,
  }) async {
    // Drift에 메모를 추가하고 id가 추가된 메모를 받아온다.
    final memoId = await _dao.createMemo(
      MemoItemsCompanion(
          notepadId: drift.Value(notepadId),
          coserId: drift.Value(coserId),
          character: drift.Value(memo.character),
          series: drift.Value(memo.series),
          isFavorite: drift.Value(memo.isFavorite),
          label: drift.Value(memo.label),
          imageBytes: drift.Value(memo.imageBytes),
          survey: drift.Value(jsonEncode(memo.survey?.toJson()))),
    );

    // 기존 Provider 데이터에 새롭게 추가한 메모를 넣어준다.
    state = [...state, memo];

    return memoId;
  }

  /// 메모를 수정한다.
  Future<void> updateMemo(MemoModel memo) async {
    await _dao.updateMemo(
        id: memo.id,
        companion: MemoItemsCompanion(
          coserId: drift.Value(memo.coser.id),
          character: drift.Value(memo.character),
          series: drift.Value(memo.series),
          imageBytes: drift.Value(memo.imageBytes),
          isFavorite: drift.Value(memo.isFavorite),
          label: drift.Value(memo.label),
          survey: drift.Value(jsonEncode(memo.survey?.toJson())),
        ));

    // Provider에 동일한 id를 가진 메모를 찾아 수정해준다.
    state = state.map((e) => e.id == memo.id ? memo : e).toList();
  }

  /// 사진 전송 여부를 수정해준다.
  Future<void> updateSent({required int id, required bool isSent}) async {
    talker.info('updateReturned id : ${id}, is : ${isSent}');
    await _dao.updateMemo(
        id: id,
        companion: MemoItemsCompanion(
          isSent: drift.Value(isSent),
        ));

    // Provider에 동일한 id를 가진 메모를 찾아 수정해준다.
    state = state.map((e) => e.id == id ? e.copyWith(isSent: isSent) : e).toList();
  }

  /// 리턴 여부를 수정해준다.
  Future<void> updateReturned({required int id, required bool isReturned}) async {
    await _dao.updateMemo(
        id: id,
        companion: MemoItemsCompanion(
          isSent: drift.Value(isReturned),
        ));

    // Provider에 동일한 id를 가진 메모를 찾아 수정해준다.
    state = state.map((e) => e.id == id ? e.copyWith(isReturned: isReturned) : e).toList();
  }

  /// 메모를 삭제한다.
  Future<void> deleteMemo(int id) async {
    // Drift에 메모 삭제
    await _dao.deleteMemo(id);
    // Provider에 동일한 id를 가진 메모를 제외하고 리스트를 재생성하여 삭제처리한다.
    state = state.where((element) => element.id != id).toList();
  }
}

/*@riverpod
class Notepad extends _$Notepad {
  final MemoDao _dao = MemoDao(database);

  @override
  NotepadModel build() {
    return ref.watch(notepadListProvider)[0];
  }

  Future<List<MemoItem>> fetchMemoList(int index) async {
    try {
      final memoList = await _dao.readAllMemo();
      return memoList;
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }

  Future<void> addMemo(MemoItem memo) async {
    return;
    // 메모를 추가하고 id가 추가된 메모를 받아온다.
    // final addedMemo = await _dao.createMemo(memo);

    //
    // try {
    //   state = state.copyWith(
    //     memoList: [...state.memoList, addedMemo],
    //   );
    // } catch (error, stackTrace) {
    //   talker.error(error.toString(), error, stackTrace);
    //   return Future.error(error, stackTrace);
    // }
  }

  Future<void> updateMemo(int index, MemoModel memo) async {
    return;
    // try {
    //   await _repository.updateMemo(memo);
    //   state = state.copyWith(
    //     memoList: state.memoList.map((e) => e.id == memo.id ? memo : e).toList(),
    //   );
    // } catch (error, stackTrace) {
    //   talker.error(error.toString(), error, stackTrace);
    //   return Future.error(error, stackTrace);
    // }
  }

  Future<void> removeMemo(int index, MemoModel memo) async {
    return;
    // try {
    //   await _repository.deleteMemo(memo.id!);
    //   state = state.copyWith(
    //     memoList: state.memoList.where((element) => element != memo).toList(),
    //   );
    // } catch (error, stackTrace) {
    //   talker.error(error.toString(), error, stackTrace);
    //   return Future.error(error, stackTrace);
    // }
  }
}*/
