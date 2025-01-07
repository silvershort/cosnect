import 'package:drift/drift.dart';

class CoserItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get snsId => text().nullable()();

  TextColumn get sns => text().nullable()();

  TextColumn get email => text().nullable()();
}

class SurveyItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get question => text()();

  TextColumn get options => text()();

  IntColumn get choice => integer()();
}

class MemoItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get notepadId => integer()();

  IntColumn get coserId => integer()();

  TextColumn get label => text().nullable()();

  BoolColumn get isFavorite => boolean().clientDefault(() => false)();
  BoolColumn get isSent => boolean().clientDefault(() => false)();
  BoolColumn get isReturned => boolean().clientDefault(() => false)();

  BlobColumn get imageBytes => blob().nullable()();

  TextColumn get series => text().nullable()();

  TextColumn get character => text().nullable()();

  TextColumn get survey => text().nullable()();
}

class NoteItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();
}
