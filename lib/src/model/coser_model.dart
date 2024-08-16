import 'dart:typed_data';

import 'package:cosnect/src/model/sns_info.dart';
import 'package:cosnect/src/model/social_icon_type.dart';
import 'package:cosnect/src/ui/widget/icon/social_icon.dart';

class CoserModel {
  final SNSAccountInfo snsInfo; // x 또는 instagram enum 클래스
  final String? snsID;
  final String? email;
  final String? series;
  final String? character;
  final Uint8List? imageBytes;

  const CoserModel({
    this.snsInfo = SNSAccountInfo.x,
    this.snsID,
    this.email,
    this.series,
    this.character,
    this.imageBytes,
  });

  SocialIconType get socialIconType {
    if (snsID == null) {
      return SocialIconType.email;
    }
    switch (snsInfo) {
      case SNSAccountInfo.x:
        return SocialIconType.x;
      case SNSAccountInfo.instagram:
        return SocialIconType.instagram;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'snsInfo': snsInfo.toString(),
      'snsID': snsID,
      'email': email,
      'series': series,
      'character': character,
      'imageBytes': imageBytes,
    };
  }

  factory CoserModel.fromMap(Map<String, dynamic> map) {
    return CoserModel(
      snsInfo: SNSAccountInfo.values.firstWhere((e) => e.toString() == map['snsInfo']),
      snsID: map['snsID'],
      email: map['email'],
      series: map['series'],
      character: map['character'],
      imageBytes: map['imageBytes'],
    );
  }

  // copyWith
  CoserModel copyWith({
    SNSAccountInfo? snsInfo,
    String? snsID,
    String? email,
    String? series,
    String? character,
    Uint8List? imageBytes,
  }) {
    return CoserModel(
      snsInfo: snsInfo ?? this.snsInfo,
      snsID: snsID ?? this.snsID,
      email: email ?? this.email,
      series: series ?? this.series,
      character: character ?? this.character,
      imageBytes: imageBytes ?? this.imageBytes,
    );
  }

  @override
  String toString() {
    return 'CoserModel{snsInfo: $snsInfo, snsID: $snsID, email: $email, series: $series, character: $character, imageBytes: $imageBytes}';
  }
}
