import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/form/notepad_model.dart';
import 'package:cosnect/src/repository/memo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notepad_list_provider.g.dart';

@riverpod
class NotepadList extends _$NotepadList {
  final MemoRepository _repository = MemoRepository();
  @override
  List<NotepadModel> build() {
    fetchNotepadList().then(
      (value) => state = value,
    );
    return [];
  }

  Future<void> addNotepad(NotepadModel notepad) async {
    await _repository.createNotepad(notepad);
    state = [...state, notepad];
  }

  Future<List<NotepadModel>> fetchNotepadList() async {
    final notepadList = await _repository.readAllNotepads();
    return notepadList;
  }

  Future<NotepadModel> getFirstNotepad() async {
    final notepadList = await fetchNotepadList();
    return notepadList[0];

  }
}

@riverpod
class MemoList extends _$MemoList {
  final MemoRepository _repository = MemoRepository();

  @override
  List<MemoModel> build() {
    fetchMemoList().then((value) => state = value);
    return [];
  }

  Future<List<MemoModel>> fetchMemoList() async {
    final memoList = await _repository.readMemoList();
    return memoList;
  }

  Future<void> updateMemo(MemoModel memo) async {
    await _repository.updateMemo(memo);
    state = state.map((e) => e.id == memo.id ? memo : e).toList();
  }
  
  Future<void> deleteMemo(MemoModel memo) async {
    await _repository.deleteMemo(memo.id!);
    state = state.where((element) => element != memo).toList();
  }
}

@riverpod
class Notepad extends _$Notepad {
  final MemoRepository _repository = MemoRepository();

  @override
  NotepadModel build() {
    return ref.watch(notepadListProvider)[0];
  }

  Future<List<MemoModel>> fetchMemoList(int index) async {
    try {
      final memoList = await _repository.readMemoList();
      return memoList;
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }

  Future<void> addMemo(MemoModel memo) async {
    // 메모를 추가하고 id가 추가된 메모를 받아온다.
    final addedMemo = await _repository.createMemo(memo);

    try {
      state = state.copyWith(
        memoList: [...state.memoList, addedMemo],
      );
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }

  Future<void> updateMemo(int index, MemoModel memo) async {
    try {
      await _repository.updateMemo(memo);
      state = state.copyWith(
        memoList: state.memoList.map((e) => e.id == memo.id ? memo : e).toList(),
      );
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }

  Future<void> removeMemo(int index, MemoModel memo) async {
    try {
      await _repository.deleteMemo(memo.id!);
      state = state.copyWith(
        memoList: state.memoList.where((element) => element != memo).toList(),
      );
    } catch (error, stackTrace) {
      talker.error(error.toString(), error, stackTrace);
      return Future.error(error, stackTrace);
    }
  }
}