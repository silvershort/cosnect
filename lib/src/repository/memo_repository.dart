// import 'dart:convert';
//
// import 'package:cosnect/main.dart';
// import 'package:cosnect/src/model/coser_model.dart';
// import 'package:cosnect/src/model/form/memo_model.dart';
// import 'package:cosnect/src/model/form/notepad_model.dart';
// import 'package:cosnect/src/repository/memo_database.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
//
// class MemoRepository {
//   // 싱글톤 구현
//   static final MemoRepository _instance = MemoRepository._internal();
//
//   factory MemoRepository() {
//     return _instance;
//   }
//
//   MemoRepository._internal();
//
//   final database = AppDatabase();
//
//   final String _notepadTable = 'notepad';
//
//   final String _coserTable = 'coser';
//   final String _surveyTable = 'survey';
//   final String _memoTable = 'memo';
//   final String _colId = 'id';
//   final String _colTitle = 'title';
//   final String _colMemoList = 'memoList';
//
//   Future<Database> get database async {
//     _database ??= await _initDB();
//     return _database!;
//   }
//
//   Future<Database> _initDB() async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, 'conect.db');
//
//     final memoDb = await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//     return memoDb;
//   }
//
//   Future<void> _createDB(Database db, int version) async {
//     //
//     // await db.execute('''
//     //   CREATE TABLE $_surveyTable(
//     //     $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
//     //     question TEXT,
//     //     optionList TEXT,
//     //     selectedIndex INTEGER
//     //   )
//     // ''');
//
//     // await db.execute('''
//     //   CREATE TABLE $_memoTable(
//     //     $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
//     //     notepadId INTEGER,
//     //     label TEXT,
//     //     coserId INTEGER,
//     //     surveyId INTEGER,
//     //     isFavorite INTEGER,
//     //     imageBytes BLOB,
//     //     surveyJson TEXT,
//     //     FOREIGN KEY (coserId) REFERENCES coser (id),
//     //     FOREIGN KEY (surveyId) REFERENCES survey (id)
//     //   )
//     // ''');
//
//     await db.execute('''
//       CREATE TABLE $_coserTable(
//         $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
//         xID TEXT,
//         email TEXT
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE $_memoTable(
//         $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
//         notepadId INTEGER,
//         label TEXT,
//         isFavorite INTEGER,
//         imageBytes BLOB,
//         coserId INTEGER,
//         series TEXT,
//         character TEXT,
//         survey TEXT
//       )
//     ''');
//
//     await db.execute('''
//       CREATE TABLE $_notepadTable(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT NOT NULL,
//         memoList TEXT NOT NULL
//       )
//     ''');
//   }
//
//   Future<CoserModel> readCoser(int id) async {
//     final db = await database;
//     final result = await db.query(
//       _coserTable,
//       where: '$_colId = ?',
//       whereArgs: [id],
//     );
//     return CoserModel.fromJson(result.first);
//   }
//
//   Future<int> createCoser(CoserModel coser) async {
//     try {
//       final db = await database;
//       final coserId = await db.insert(
//         _coserTable,
//         {
//           'xID': coser.xID,
//           'email': coser.email,
//         },
//         conflictAlgorithm: ConflictAlgorithm.replace,
//       );
//       return coserId;
//     } catch (error, stackTrace) {
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<({int id, CoserModel coser})> updateCoser(int coserId, CoserModel coser) async {
//     try {
//       final db = await database;
//       final result = await db.update(
//         _coserTable,
//         {
//           'xID': coser.xID,
//           'email': coser.email,
//         },
//         where: '$_colId = ?',
//         whereArgs: [coserId],
//       );
//       return (id: result, coser: coser);
//     } catch (error, stackTrace) {
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<int?> existsCoser(CoserModel coser) async {
//     final db = await database;
//
//     if (coser.xID != null) {
//       final result = await db.query(
//         _coserTable,
//         where: 'xID = ?',
//         whereArgs: [coser.xID],
//       );
//       // 결과가 있다면 id 반환 없으면 null 반환
//       return result.firstOrNull?[_colId] as int?;
//     }
//     // email로 검색
//     else {
//       final result = await db.query(
//         _coserTable,
//         where: 'email = ?',
//         whereArgs: [coser.email],
//       );
//       return result.firstOrNull?[_colId] as int?;
//     }
//   }
//
//   Future<MemoModel> readMemo(MemoModel memo) async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> result = await db.query(
//         _memoTable,
//         where: '$_colId = ?',
//         whereArgs: [memo.id],
//       );
//       MemoModel memoModel = MemoModel.fromDatabase(result.first);
//       final CoserModel coser = await readCoser(memoModel.coserId!);
//       return memoModel.copyWith(coser: coser);
//     } catch (error, stackTrace) {
//       talker.error(error.toString(), error, stackTrace);
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<List<MemoModel>> readMemoList() async {
//     try {
//       final db = await database;
//       final List<Map<String, dynamic>> result = await db.query(_memoTable);
//
//       List<MemoModel> memoList = [];
//       for (var map in result) {
//         final CoserModel coser = await readCoser(map['coserId']);
//         memoList.add(MemoModel.fromDatabase(map).copyWith(coser: coser));
//       }
//       return memoList;
//     } catch (error, stackTrace) {
//       talker.error(error.toString(), error, stackTrace);
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<MemoModel> createMemo(MemoModel memo) async {
//     try {
//       // 기존에 등록이 되어있는 코스어인지 확인 하고 아이디를 받아온다.
//       int? coserId = await existsCoser(memo.coser);
//       // 새로운 코스어라면 코스어를 추가하고 아이디를 받아온다.
//       coserId ??= await createCoser(memo.coser);
//
//       // 메모 데이터를 추가하는 코드
//       final int? id = await _database?.insert(
//         _memoTable,
//         {
//           'notepadId': memo.notepadId,
//           'label': memo.label,
//           'isFavorite': memo.isFavorite,
//           'imageBytes': memo.imageBytes,
//           'coserId': coserId,
//           'series': memo.series,
//           'character': memo.character,
//           'survey': jsonEncode(memo.survey?.toJson()),
//         },
//       );
//
//       return memo.copyWith(
//         id: id,
//         coserId: coserId,
//       );
//     } catch (error, stackTrace) {
//       talker.error(error.toString(), error, stackTrace);
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<int> updateMemo(MemoModel memo) async {
//     talker.info('updateMemo');
//     talker.debug('MemoModel: $memo');
//     try {
//       final db = await database;
//       final int result = await db.update(
//         _memoTable,
//         {
//           'notepadId': memo.notepadId,
//           'label': memo.label,
//           'isFavorite': memo.isFavorite,
//           'imageBytes': memo.imageBytes,
//           'coserId': memo.coserId,
//           'series': memo.series,
//           'character': memo.character,
//           'survey': jsonEncode(memo.survey?.toJson()),
//         },
//         where: '$_colId = ?',
//         whereArgs: [memo.id],
//       );
//
//       await db.update(
//         _coserTable,
//         {
//           'xID': memo.coser.xID,
//           'email': memo.coser.email,
//         },
//         where: '$_colId = ?',
//         whereArgs: [memo.coserId],
//       );
//       return result;
//     } catch (error, stackTrace) {
//       talker.error(error.toString(), error, stackTrace);
//       return Future.error(error, stackTrace);
//     }
//   }
//
//   Future<int> deleteMemo(int id) async {
//     final db = await database;
//     final int result = await db.delete(
//       _memoTable,
//       where: '$_colId = ?',
//       whereArgs: [id],
//     );
//     return result;
//   }
//
//   // Notepad CRUD
//   Future<int> createNotepad(NotepadModel notepad) async {
//     final db = await database;
//
//     int notepadId = await db.insert(
//       _notepadTable,
//       {
//         'title': notepad.title,
//         'memoList': jsonEncode(notepad.memoList.map((memo) => memo.toJson()).toList()),
//       },
//     );
//
//     return notepadId;
//   }
//
//   Future<List<NotepadModel>> readAllNotepads() async {
//     final db = await database;
//     final result = await db.query(_notepadTable);
//     return result.map((map) => NotepadModel.fromMap(map)).toList();
//   }
// }
