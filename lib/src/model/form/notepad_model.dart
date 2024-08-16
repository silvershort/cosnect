import 'dart:convert';

import 'package:cosnect/src/model/form/memo_model.dart';

class NotepadModel {
  final int? id;
  final String title;
  final List<MemoModel> memoList;

  const NotepadModel({
    this.id,
    required this.title,
    required this.memoList,
  });

  NotepadModel copyWith({
    int? id,
    String? title,
    List<MemoModel>? memoList,
  }) {
    return NotepadModel(
      id: id ?? this.id,
      title: title ?? this.title,
      memoList: memoList ?? this.memoList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'memoList': jsonEncode(memoList.map((memo) => memo.toMap()).toList()),
    };
  }

  static NotepadModel fromMap(Map<String, dynamic> map) {
    return NotepadModel(
      id: map['id'],
      title: map['title'],
      memoList: (jsonDecode(map['memoList']) as List).map((memo) => MemoModel.fromMap(memo)).toList(),
    );
  }
}