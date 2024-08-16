import 'dart:io';

import 'package:cosnect/main.dart';
import 'package:cosnect/src/model/coser_model.dart';
import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:cosnect/src/model/form/notepad_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MemoRepository {
  // 싱글톤 구현
  static final MemoRepository _instance = MemoRepository._internal();

  factory MemoRepository() {
    return _instance;
  }

  MemoRepository._internal();

  static Database? _database;

  final String _notepadTable = 'notepad';

  final String _coserTable = 'coser';
  final String _surveyTable = 'survey';
  final String _memoTable = 'memo';
  final String _colId = 'id';
  final String _colTitle = 'title';
  final String _colMemoList = 'memoList';

  Future<Database> get database async {
    _database ??= await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'conect.db');

    final memoDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
    return memoDb;
  }

  Future<void> _createDB(Database db, int version) async {
    // await db.execute('''
    //   CREATE TABLE $_coserTable(
    //     $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
    //     snsInfo TEXT,
    //     snsID TEXT,
    //     email TEXT,
    //     series TEXT,
    //     character TEXT
    //   )
    // ''');
    //
    // await db.execute('''
    //   CREATE TABLE $_surveyTable(
    //     $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
    //     question TEXT,
    //     optionList TEXT,
    //     selectedIndex INTEGER
    //   )
    // ''');

    // await db.execute('''
    //   CREATE TABLE $_memoTable(
    //     $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
    //     notepadId INTEGER,
    //     label TEXT,
    //     coserId INTEGER,
    //     surveyId INTEGER,
    //     isFavorite INTEGER,
    //     imageBytes BLOB,
    //     surveyJson TEXT,
    //     FOREIGN KEY (coserId) REFERENCES coser (id),
    //     FOREIGN KEY (surveyId) REFERENCES survey (id)
    //   )
    // ''');

    await db.execute('''
      CREATE TABLE $_memoTable(
        $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
        notepadId INTEGER,
        label TEXT,
        isFavorite INTEGER,
        imageBytes BLOB,
        coser TEXT,
        survey TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $_notepadTable(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        memoList TEXT NOT NULL
      )
    ''');
  }

  Future<int> readMemo(MemoModel memo) async {
    final db = await database;
    final int result = await db.insert(_memoTable, memo.toMap());
    return result;
  }

  Future<List<MemoModel>> readMemoList() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(_memoTable);

    List<MemoModel> memoList = [];
    for (var map in result) {
      memoList.add(MemoModel.fromMap(map));
    }
    return memoList;
  }

  Future<int> createMemo(MemoModel memo) async {
    final db = await database;
    final int result = await db.insert(_memoTable, memo.toMap());
    return result;
  }

  Future<int> updateMemo(MemoModel memo) async {
    final db = await database;
    final int result = await db.update(
      _memoTable,
      memo.toMap(),
      where: '$_colId = ?',
      whereArgs: [memo.id],
    );
    return result;
  }

  Future<int> deleteMemo(int id) async {
    final db = await database;
    final int result = await db.delete(
      _memoTable,
      where: '$_colId = ?',
      whereArgs: [id],
    );
    return result;
  }

  // Notepad CRUD
  // Create operations
  // Create operations
  Future<int> createNotepad(NotepadModel notepad) async {
    final db = await database;

    int notepadId = await db.insert(
      _notepadTable,
      notepad.toMap(),
    );

    return notepadId;
  }

  Future<List<NotepadModel>> readAllNotepads() async {
    final db = await database;
    final result = await db.query(_notepadTable);
    return result.map((map) => NotepadModel.fromMap(map)).toList();
  }
}
