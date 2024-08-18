import 'dart:convert';

import 'package:cosnect/src/model/form/memo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notepad_model.g.dart';

part 'notepad_model.freezed.dart';

@freezed
class NotepadModel with _$NotepadModel {
  const factory NotepadModel({
    int? id,
    required String title,
    required List<MemoModel> memoList,
  }) = _NotepadModel;

  factory NotepadModel.fromJson(Map<String, dynamic> json) => _$NotepadModelFromJson(json);

  factory NotepadModel.fromMap(Map<String, dynamic> map) => NotepadModel(
        id: map['id'],
        title: map['title'],
        memoList: (jsonDecode(map['memoList']) as List).map((memo) => MemoModel.fromJson(memo)).toList(),
      );
}

// class NotepadModel {
//   final int? id;
//   final String title;
//   final List<MemoModel> memoList;
//
//   const NotepadModel({
//     this.id,
//     required this.title,
//     required this.memoList,
//   });
//
//   NotepadModel copyWith({
//     int? id,
//     String? title,
//     List<MemoModel>? memoList,
//   }) {
//     return NotepadModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       memoList: memoList ?? this.memoList,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'title': title,
//       'memoList': jsonEncode(memoList.map((memo) => memo.toMap()).toList()),
//     };
//   }
//
//   static NotepadModel fromMap(Map<String, dynamic> map) {
//     return NotepadModel(
//       id: map['id'],
//       title: map['title'],
//       memoList: (jsonDecode(map['memoList']) as List).map((memo) => MemoModel.fromMap(memo)).toList(),
//     );
//   }
// }
