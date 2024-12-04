import 'package:cosnect/src/repository/memo_table.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'memo_database.g.dart';

@DriftDatabase(tables: [CoserItems, SurveyItems, MemoItems, NoteItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'cosnect_database');
  }
}
