import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/form/coser_model.dart';
import 'package:cosnect/src/repository/memo_dao.dart';
import 'package:cosnect/src/repository/memo_database.dart';
import 'package:cosnect/src/util/extension/string_extension.dart';
import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'coser_provider.g.dart';

@Riverpod(keepAlive: true)
class Coser extends _$Coser {
  final _dao = MemoDao(database);

  @override
  List<CoserModel> build() {
    return [];
  }

  Future<int> addCoser({
    String? snsId,
    String? sns,
    String? email,
  }) async {
    assert(snsId != null || email != null, 'sns id 혹은 email 값 중 하나는 반드시 입력되어야 합니다.');

    final id = await _dao.createCoser(CoserItemsCompanion(
      snsId: Value(snsId),
      sns: Value(sns),
      email: Value(email),
    ));

    state = [
      ...state,
      CoserModel(
        id: id,
        sns: sns.getSNSInfo(),
        snsId: snsId,
        email: email,
      )
    ];

    return id;
  }

  Future<int> addOrUpdateCoser({
    int? id,
    String? snsId,
    String? sns,
    String? email,
  }) async {
    final companion = CoserItemsCompanion(
      snsId: Value(snsId),
      sns: Value(sns),
      email: Value(email),
    );

    final coser = await _dao.existsCoser(companion);

    if (id == null && coser != null) {
      id = await _dao.updateCoser(
        id: coser.id,
        companion: companion,
      );
    } else {
      id = await _dao.createCoser(companion);
    }

    state = [
      ...state,
      CoserModel(
        id: id,
        sns: sns.getSNSInfo(),
        snsId: snsId,
        email: email,
      )
    ];

    return id;
  }

  Future<List<CoserModel>> fetchCoserList() async {
    final List<CoserItem> list = await _dao.readAllCoser();
    final coserList = list.map((e) => CoserModel.fromItem(e)).toList();

    talker.debug('Coser List : ${coserList.toString()}');
    state = coserList;
    return coserList;
  }

  Future<void> deleteCoser(int id) async {
    await _dao.deleteCoser(id);
    return;
  }
}
