import 'package:cosnect/src/repository/memo_database.dart';
import 'package:cosnect/src/repository/memo_table.dart';
import 'package:drift/drift.dart';

part 'memo_dao.g.dart';

@DriftAccessor(tables: [CoserItems, SurveyItems, MemoItems, NoteItems])
class MemoDao extends DatabaseAccessor<AppDatabase> with _$MemoDaoMixin {
  MemoDao(super.db);

  Future<int> createCoser(CoserItemsCompanion companion) async {
    return await into(coserItems).insert(companion);
  }

  Future<List<CoserItem>> readAllCoser() async {
    return await select(coserItems).get();
  }

  Future<CoserItem> readCoser(int id) async {
    return await (select(coserItems)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> updateCoser({required int id, required CoserItemsCompanion companion}) async {
    return await (update(coserItems)..where((tbl) => tbl.id.equals(id))).write(companion);
  }

  Future<int> deleteCoser(int id) async {
    return await (delete(coserItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> deleteAllCoser() async {
    return await delete(coserItems).go();
}

  Future<CoserItem?> existsCoser(CoserItemsCompanion companion) async {
    final query = select(coserItems)
        ..where((tbl) =>
          tbl.snsId.equals(companion.snsId.value ?? '') |
            tbl.email.equals(companion.email.value ?? '')
        );
    return query.getSingleOrNull();
  }

  Future<int> createMemo(MemoItemsCompanion companion) async {
    return await into(memoItems).insert(companion);
  }

  Future<List<MemoItem>> readAllMemo({int? notepadId}) async {
    if (notepadId == null) {
      return await select(memoItems).get(); 
    } else {
      return await (select(memoItems)..where((tbl) => tbl.notepadId.equals(notepadId))).get();
    }
  }

  Future<MemoItem> readMemo(int id) async {
    return await (select(memoItems)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<int> updateMemo({required int id, required MemoItemsCompanion companion}) async {
    return await (update(memoItems)..where((tbl) => tbl.id.equals(id))).write(companion);
  }

  Future<int> deleteMemo(int id) async {
    return await (delete(memoItems)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<int> createNotepad(NoteItemsCompanion companion) async {
    return await into(noteItems).insert(companion);
  }

  Future<List<NoteItem>> readAllNotepad() async {
    return await select(noteItems).get();
  }
}