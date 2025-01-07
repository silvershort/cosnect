// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_database.dart';

// ignore_for_file: type=lint
class $CoserItemsTable extends CoserItems
    with TableInfo<$CoserItemsTable, CoserItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoserItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _snsIdMeta = const VerificationMeta('snsId');
  @override
  late final GeneratedColumn<String> snsId = GeneratedColumn<String>(
      'sns_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _snsMeta = const VerificationMeta('sns');
  @override
  late final GeneratedColumn<String> sns = GeneratedColumn<String>(
      'sns', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, snsId, sns, email];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'coser_items';
  @override
  VerificationContext validateIntegrity(Insertable<CoserItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('sns_id')) {
      context.handle(
          _snsIdMeta, snsId.isAcceptableOrUnknown(data['sns_id']!, _snsIdMeta));
    }
    if (data.containsKey('sns')) {
      context.handle(
          _snsMeta, sns.isAcceptableOrUnknown(data['sns']!, _snsMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoserItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoserItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      snsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sns_id']),
      sns: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sns']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
    );
  }

  @override
  $CoserItemsTable createAlias(String alias) {
    return $CoserItemsTable(attachedDatabase, alias);
  }
}

class CoserItem extends DataClass implements Insertable<CoserItem> {
  final int id;
  final String? snsId;
  final String? sns;
  final String? email;
  const CoserItem({required this.id, this.snsId, this.sns, this.email});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || snsId != null) {
      map['sns_id'] = Variable<String>(snsId);
    }
    if (!nullToAbsent || sns != null) {
      map['sns'] = Variable<String>(sns);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    return map;
  }

  CoserItemsCompanion toCompanion(bool nullToAbsent) {
    return CoserItemsCompanion(
      id: Value(id),
      snsId:
          snsId == null && nullToAbsent ? const Value.absent() : Value(snsId),
      sns: sns == null && nullToAbsent ? const Value.absent() : Value(sns),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
    );
  }

  factory CoserItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoserItem(
      id: serializer.fromJson<int>(json['id']),
      snsId: serializer.fromJson<String?>(json['snsId']),
      sns: serializer.fromJson<String?>(json['sns']),
      email: serializer.fromJson<String?>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'snsId': serializer.toJson<String?>(snsId),
      'sns': serializer.toJson<String?>(sns),
      'email': serializer.toJson<String?>(email),
    };
  }

  CoserItem copyWith(
          {int? id,
          Value<String?> snsId = const Value.absent(),
          Value<String?> sns = const Value.absent(),
          Value<String?> email = const Value.absent()}) =>
      CoserItem(
        id: id ?? this.id,
        snsId: snsId.present ? snsId.value : this.snsId,
        sns: sns.present ? sns.value : this.sns,
        email: email.present ? email.value : this.email,
      );
  CoserItem copyWithCompanion(CoserItemsCompanion data) {
    return CoserItem(
      id: data.id.present ? data.id.value : this.id,
      snsId: data.snsId.present ? data.snsId.value : this.snsId,
      sns: data.sns.present ? data.sns.value : this.sns,
      email: data.email.present ? data.email.value : this.email,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoserItem(')
          ..write('id: $id, ')
          ..write('snsId: $snsId, ')
          ..write('sns: $sns, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, snsId, sns, email);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoserItem &&
          other.id == this.id &&
          other.snsId == this.snsId &&
          other.sns == this.sns &&
          other.email == this.email);
}

class CoserItemsCompanion extends UpdateCompanion<CoserItem> {
  final Value<int> id;
  final Value<String?> snsId;
  final Value<String?> sns;
  final Value<String?> email;
  const CoserItemsCompanion({
    this.id = const Value.absent(),
    this.snsId = const Value.absent(),
    this.sns = const Value.absent(),
    this.email = const Value.absent(),
  });
  CoserItemsCompanion.insert({
    this.id = const Value.absent(),
    this.snsId = const Value.absent(),
    this.sns = const Value.absent(),
    this.email = const Value.absent(),
  });
  static Insertable<CoserItem> custom({
    Expression<int>? id,
    Expression<String>? snsId,
    Expression<String>? sns,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (snsId != null) 'sns_id': snsId,
      if (sns != null) 'sns': sns,
      if (email != null) 'email': email,
    });
  }

  CoserItemsCompanion copyWith(
      {Value<int>? id,
      Value<String?>? snsId,
      Value<String?>? sns,
      Value<String?>? email}) {
    return CoserItemsCompanion(
      id: id ?? this.id,
      snsId: snsId ?? this.snsId,
      sns: sns ?? this.sns,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (snsId.present) {
      map['sns_id'] = Variable<String>(snsId.value);
    }
    if (sns.present) {
      map['sns'] = Variable<String>(sns.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoserItemsCompanion(')
          ..write('id: $id, ')
          ..write('snsId: $snsId, ')
          ..write('sns: $sns, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $SurveyItemsTable extends SurveyItems
    with TableInfo<$SurveyItemsTable, SurveyItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SurveyItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _questionMeta =
      const VerificationMeta('question');
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
      'question', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionsMeta =
      const VerificationMeta('options');
  @override
  late final GeneratedColumn<String> options = GeneratedColumn<String>(
      'options', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _choiceMeta = const VerificationMeta('choice');
  @override
  late final GeneratedColumn<int> choice = GeneratedColumn<int>(
      'choice', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, question, options, choice];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'survey_items';
  @override
  VerificationContext validateIntegrity(Insertable<SurveyItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question')) {
      context.handle(_questionMeta,
          question.isAcceptableOrUnknown(data['question']!, _questionMeta));
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('options')) {
      context.handle(_optionsMeta,
          options.isAcceptableOrUnknown(data['options']!, _optionsMeta));
    } else if (isInserting) {
      context.missing(_optionsMeta);
    }
    if (data.containsKey('choice')) {
      context.handle(_choiceMeta,
          choice.isAcceptableOrUnknown(data['choice']!, _choiceMeta));
    } else if (isInserting) {
      context.missing(_choiceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SurveyItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SurveyItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      question: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}question'])!,
      options: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}options'])!,
      choice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}choice'])!,
    );
  }

  @override
  $SurveyItemsTable createAlias(String alias) {
    return $SurveyItemsTable(attachedDatabase, alias);
  }
}

class SurveyItem extends DataClass implements Insertable<SurveyItem> {
  final int id;
  final String question;
  final String options;
  final int choice;
  const SurveyItem(
      {required this.id,
      required this.question,
      required this.options,
      required this.choice});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question'] = Variable<String>(question);
    map['options'] = Variable<String>(options);
    map['choice'] = Variable<int>(choice);
    return map;
  }

  SurveyItemsCompanion toCompanion(bool nullToAbsent) {
    return SurveyItemsCompanion(
      id: Value(id),
      question: Value(question),
      options: Value(options),
      choice: Value(choice),
    );
  }

  factory SurveyItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SurveyItem(
      id: serializer.fromJson<int>(json['id']),
      question: serializer.fromJson<String>(json['question']),
      options: serializer.fromJson<String>(json['options']),
      choice: serializer.fromJson<int>(json['choice']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'question': serializer.toJson<String>(question),
      'options': serializer.toJson<String>(options),
      'choice': serializer.toJson<int>(choice),
    };
  }

  SurveyItem copyWith(
          {int? id, String? question, String? options, int? choice}) =>
      SurveyItem(
        id: id ?? this.id,
        question: question ?? this.question,
        options: options ?? this.options,
        choice: choice ?? this.choice,
      );
  SurveyItem copyWithCompanion(SurveyItemsCompanion data) {
    return SurveyItem(
      id: data.id.present ? data.id.value : this.id,
      question: data.question.present ? data.question.value : this.question,
      options: data.options.present ? data.options.value : this.options,
      choice: data.choice.present ? data.choice.value : this.choice,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SurveyItem(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('choice: $choice')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, question, options, choice);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SurveyItem &&
          other.id == this.id &&
          other.question == this.question &&
          other.options == this.options &&
          other.choice == this.choice);
}

class SurveyItemsCompanion extends UpdateCompanion<SurveyItem> {
  final Value<int> id;
  final Value<String> question;
  final Value<String> options;
  final Value<int> choice;
  const SurveyItemsCompanion({
    this.id = const Value.absent(),
    this.question = const Value.absent(),
    this.options = const Value.absent(),
    this.choice = const Value.absent(),
  });
  SurveyItemsCompanion.insert({
    this.id = const Value.absent(),
    required String question,
    required String options,
    required int choice,
  })  : question = Value(question),
        options = Value(options),
        choice = Value(choice);
  static Insertable<SurveyItem> custom({
    Expression<int>? id,
    Expression<String>? question,
    Expression<String>? options,
    Expression<int>? choice,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (question != null) 'question': question,
      if (options != null) 'options': options,
      if (choice != null) 'choice': choice,
    });
  }

  SurveyItemsCompanion copyWith(
      {Value<int>? id,
      Value<String>? question,
      Value<String>? options,
      Value<int>? choice}) {
    return SurveyItemsCompanion(
      id: id ?? this.id,
      question: question ?? this.question,
      options: options ?? this.options,
      choice: choice ?? this.choice,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (options.present) {
      map['options'] = Variable<String>(options.value);
    }
    if (choice.present) {
      map['choice'] = Variable<int>(choice.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SurveyItemsCompanion(')
          ..write('id: $id, ')
          ..write('question: $question, ')
          ..write('options: $options, ')
          ..write('choice: $choice')
          ..write(')'))
        .toString();
  }
}

class $MemoItemsTable extends MemoItems
    with TableInfo<$MemoItemsTable, MemoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _notepadIdMeta =
      const VerificationMeta('notepadId');
  @override
  late final GeneratedColumn<int> notepadId = GeneratedColumn<int>(
      'notepad_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _coserIdMeta =
      const VerificationMeta('coserId');
  @override
  late final GeneratedColumn<int> coserId = GeneratedColumn<int>(
      'coser_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_favorite" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _isSentMeta = const VerificationMeta('isSent');
  @override
  late final GeneratedColumn<bool> isSent = GeneratedColumn<bool>(
      'is_sent', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_sent" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _isReturnedMeta =
      const VerificationMeta('isReturned');
  @override
  late final GeneratedColumn<bool> isReturned = GeneratedColumn<bool>(
      'is_returned', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_returned" IN (0, 1))'),
      clientDefault: () => false);
  static const VerificationMeta _imageBytesMeta =
      const VerificationMeta('imageBytes');
  @override
  late final GeneratedColumn<Uint8List> imageBytes = GeneratedColumn<Uint8List>(
      'image_bytes', aliasedName, true,
      type: DriftSqlType.blob, requiredDuringInsert: false);
  static const VerificationMeta _seriesMeta = const VerificationMeta('series');
  @override
  late final GeneratedColumn<String> series = GeneratedColumn<String>(
      'series', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _characterMeta =
      const VerificationMeta('character');
  @override
  late final GeneratedColumn<String> character = GeneratedColumn<String>(
      'character', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _surveyMeta = const VerificationMeta('survey');
  @override
  late final GeneratedColumn<String> survey = GeneratedColumn<String>(
      'survey', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        notepadId,
        coserId,
        label,
        isFavorite,
        isSent,
        isReturned,
        imageBytes,
        series,
        character,
        survey
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'memo_items';
  @override
  VerificationContext validateIntegrity(Insertable<MemoItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('notepad_id')) {
      context.handle(_notepadIdMeta,
          notepadId.isAcceptableOrUnknown(data['notepad_id']!, _notepadIdMeta));
    } else if (isInserting) {
      context.missing(_notepadIdMeta);
    }
    if (data.containsKey('coser_id')) {
      context.handle(_coserIdMeta,
          coserId.isAcceptableOrUnknown(data['coser_id']!, _coserIdMeta));
    } else if (isInserting) {
      context.missing(_coserIdMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('is_sent')) {
      context.handle(_isSentMeta,
          isSent.isAcceptableOrUnknown(data['is_sent']!, _isSentMeta));
    }
    if (data.containsKey('is_returned')) {
      context.handle(
          _isReturnedMeta,
          isReturned.isAcceptableOrUnknown(
              data['is_returned']!, _isReturnedMeta));
    }
    if (data.containsKey('image_bytes')) {
      context.handle(
          _imageBytesMeta,
          imageBytes.isAcceptableOrUnknown(
              data['image_bytes']!, _imageBytesMeta));
    }
    if (data.containsKey('series')) {
      context.handle(_seriesMeta,
          series.isAcceptableOrUnknown(data['series']!, _seriesMeta));
    }
    if (data.containsKey('character')) {
      context.handle(_characterMeta,
          character.isAcceptableOrUnknown(data['character']!, _characterMeta));
    }
    if (data.containsKey('survey')) {
      context.handle(_surveyMeta,
          survey.isAcceptableOrUnknown(data['survey']!, _surveyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemoItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      notepadId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}notepad_id'])!,
      coserId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}coser_id'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label']),
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
      isSent: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_sent'])!,
      isReturned: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_returned'])!,
      imageBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.blob, data['${effectivePrefix}image_bytes']),
      series: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}series']),
      character: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}character']),
      survey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}survey']),
    );
  }

  @override
  $MemoItemsTable createAlias(String alias) {
    return $MemoItemsTable(attachedDatabase, alias);
  }
}

class MemoItem extends DataClass implements Insertable<MemoItem> {
  final int id;
  final int notepadId;
  final int coserId;
  final String? label;
  final bool isFavorite;
  final bool isSent;
  final bool isReturned;
  final Uint8List? imageBytes;
  final String? series;
  final String? character;
  final String? survey;
  const MemoItem(
      {required this.id,
      required this.notepadId,
      required this.coserId,
      this.label,
      required this.isFavorite,
      required this.isSent,
      required this.isReturned,
      this.imageBytes,
      this.series,
      this.character,
      this.survey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['notepad_id'] = Variable<int>(notepadId);
    map['coser_id'] = Variable<int>(coserId);
    if (!nullToAbsent || label != null) {
      map['label'] = Variable<String>(label);
    }
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['is_sent'] = Variable<bool>(isSent);
    map['is_returned'] = Variable<bool>(isReturned);
    if (!nullToAbsent || imageBytes != null) {
      map['image_bytes'] = Variable<Uint8List>(imageBytes);
    }
    if (!nullToAbsent || series != null) {
      map['series'] = Variable<String>(series);
    }
    if (!nullToAbsent || character != null) {
      map['character'] = Variable<String>(character);
    }
    if (!nullToAbsent || survey != null) {
      map['survey'] = Variable<String>(survey);
    }
    return map;
  }

  MemoItemsCompanion toCompanion(bool nullToAbsent) {
    return MemoItemsCompanion(
      id: Value(id),
      notepadId: Value(notepadId),
      coserId: Value(coserId),
      label:
          label == null && nullToAbsent ? const Value.absent() : Value(label),
      isFavorite: Value(isFavorite),
      isSent: Value(isSent),
      isReturned: Value(isReturned),
      imageBytes: imageBytes == null && nullToAbsent
          ? const Value.absent()
          : Value(imageBytes),
      series:
          series == null && nullToAbsent ? const Value.absent() : Value(series),
      character: character == null && nullToAbsent
          ? const Value.absent()
          : Value(character),
      survey:
          survey == null && nullToAbsent ? const Value.absent() : Value(survey),
    );
  }

  factory MemoItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemoItem(
      id: serializer.fromJson<int>(json['id']),
      notepadId: serializer.fromJson<int>(json['notepadId']),
      coserId: serializer.fromJson<int>(json['coserId']),
      label: serializer.fromJson<String?>(json['label']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      isSent: serializer.fromJson<bool>(json['isSent']),
      isReturned: serializer.fromJson<bool>(json['isReturned']),
      imageBytes: serializer.fromJson<Uint8List?>(json['imageBytes']),
      series: serializer.fromJson<String?>(json['series']),
      character: serializer.fromJson<String?>(json['character']),
      survey: serializer.fromJson<String?>(json['survey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'notepadId': serializer.toJson<int>(notepadId),
      'coserId': serializer.toJson<int>(coserId),
      'label': serializer.toJson<String?>(label),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'isSent': serializer.toJson<bool>(isSent),
      'isReturned': serializer.toJson<bool>(isReturned),
      'imageBytes': serializer.toJson<Uint8List?>(imageBytes),
      'series': serializer.toJson<String?>(series),
      'character': serializer.toJson<String?>(character),
      'survey': serializer.toJson<String?>(survey),
    };
  }

  MemoItem copyWith(
          {int? id,
          int? notepadId,
          int? coserId,
          Value<String?> label = const Value.absent(),
          bool? isFavorite,
          bool? isSent,
          bool? isReturned,
          Value<Uint8List?> imageBytes = const Value.absent(),
          Value<String?> series = const Value.absent(),
          Value<String?> character = const Value.absent(),
          Value<String?> survey = const Value.absent()}) =>
      MemoItem(
        id: id ?? this.id,
        notepadId: notepadId ?? this.notepadId,
        coserId: coserId ?? this.coserId,
        label: label.present ? label.value : this.label,
        isFavorite: isFavorite ?? this.isFavorite,
        isSent: isSent ?? this.isSent,
        isReturned: isReturned ?? this.isReturned,
        imageBytes: imageBytes.present ? imageBytes.value : this.imageBytes,
        series: series.present ? series.value : this.series,
        character: character.present ? character.value : this.character,
        survey: survey.present ? survey.value : this.survey,
      );
  MemoItem copyWithCompanion(MemoItemsCompanion data) {
    return MemoItem(
      id: data.id.present ? data.id.value : this.id,
      notepadId: data.notepadId.present ? data.notepadId.value : this.notepadId,
      coserId: data.coserId.present ? data.coserId.value : this.coserId,
      label: data.label.present ? data.label.value : this.label,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      isSent: data.isSent.present ? data.isSent.value : this.isSent,
      isReturned:
          data.isReturned.present ? data.isReturned.value : this.isReturned,
      imageBytes:
          data.imageBytes.present ? data.imageBytes.value : this.imageBytes,
      series: data.series.present ? data.series.value : this.series,
      character: data.character.present ? data.character.value : this.character,
      survey: data.survey.present ? data.survey.value : this.survey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MemoItem(')
          ..write('id: $id, ')
          ..write('notepadId: $notepadId, ')
          ..write('coserId: $coserId, ')
          ..write('label: $label, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isSent: $isSent, ')
          ..write('isReturned: $isReturned, ')
          ..write('imageBytes: $imageBytes, ')
          ..write('series: $series, ')
          ..write('character: $character, ')
          ..write('survey: $survey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      notepadId,
      coserId,
      label,
      isFavorite,
      isSent,
      isReturned,
      $driftBlobEquality.hash(imageBytes),
      series,
      character,
      survey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemoItem &&
          other.id == this.id &&
          other.notepadId == this.notepadId &&
          other.coserId == this.coserId &&
          other.label == this.label &&
          other.isFavorite == this.isFavorite &&
          other.isSent == this.isSent &&
          other.isReturned == this.isReturned &&
          $driftBlobEquality.equals(other.imageBytes, this.imageBytes) &&
          other.series == this.series &&
          other.character == this.character &&
          other.survey == this.survey);
}

class MemoItemsCompanion extends UpdateCompanion<MemoItem> {
  final Value<int> id;
  final Value<int> notepadId;
  final Value<int> coserId;
  final Value<String?> label;
  final Value<bool> isFavorite;
  final Value<bool> isSent;
  final Value<bool> isReturned;
  final Value<Uint8List?> imageBytes;
  final Value<String?> series;
  final Value<String?> character;
  final Value<String?> survey;
  const MemoItemsCompanion({
    this.id = const Value.absent(),
    this.notepadId = const Value.absent(),
    this.coserId = const Value.absent(),
    this.label = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isSent = const Value.absent(),
    this.isReturned = const Value.absent(),
    this.imageBytes = const Value.absent(),
    this.series = const Value.absent(),
    this.character = const Value.absent(),
    this.survey = const Value.absent(),
  });
  MemoItemsCompanion.insert({
    this.id = const Value.absent(),
    required int notepadId,
    required int coserId,
    this.label = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.isSent = const Value.absent(),
    this.isReturned = const Value.absent(),
    this.imageBytes = const Value.absent(),
    this.series = const Value.absent(),
    this.character = const Value.absent(),
    this.survey = const Value.absent(),
  })  : notepadId = Value(notepadId),
        coserId = Value(coserId);
  static Insertable<MemoItem> custom({
    Expression<int>? id,
    Expression<int>? notepadId,
    Expression<int>? coserId,
    Expression<String>? label,
    Expression<bool>? isFavorite,
    Expression<bool>? isSent,
    Expression<bool>? isReturned,
    Expression<Uint8List>? imageBytes,
    Expression<String>? series,
    Expression<String>? character,
    Expression<String>? survey,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (notepadId != null) 'notepad_id': notepadId,
      if (coserId != null) 'coser_id': coserId,
      if (label != null) 'label': label,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (isSent != null) 'is_sent': isSent,
      if (isReturned != null) 'is_returned': isReturned,
      if (imageBytes != null) 'image_bytes': imageBytes,
      if (series != null) 'series': series,
      if (character != null) 'character': character,
      if (survey != null) 'survey': survey,
    });
  }

  MemoItemsCompanion copyWith(
      {Value<int>? id,
      Value<int>? notepadId,
      Value<int>? coserId,
      Value<String?>? label,
      Value<bool>? isFavorite,
      Value<bool>? isSent,
      Value<bool>? isReturned,
      Value<Uint8List?>? imageBytes,
      Value<String?>? series,
      Value<String?>? character,
      Value<String?>? survey}) {
    return MemoItemsCompanion(
      id: id ?? this.id,
      notepadId: notepadId ?? this.notepadId,
      coserId: coserId ?? this.coserId,
      label: label ?? this.label,
      isFavorite: isFavorite ?? this.isFavorite,
      isSent: isSent ?? this.isSent,
      isReturned: isReturned ?? this.isReturned,
      imageBytes: imageBytes ?? this.imageBytes,
      series: series ?? this.series,
      character: character ?? this.character,
      survey: survey ?? this.survey,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (notepadId.present) {
      map['notepad_id'] = Variable<int>(notepadId.value);
    }
    if (coserId.present) {
      map['coser_id'] = Variable<int>(coserId.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (isSent.present) {
      map['is_sent'] = Variable<bool>(isSent.value);
    }
    if (isReturned.present) {
      map['is_returned'] = Variable<bool>(isReturned.value);
    }
    if (imageBytes.present) {
      map['image_bytes'] = Variable<Uint8List>(imageBytes.value);
    }
    if (series.present) {
      map['series'] = Variable<String>(series.value);
    }
    if (character.present) {
      map['character'] = Variable<String>(character.value);
    }
    if (survey.present) {
      map['survey'] = Variable<String>(survey.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemoItemsCompanion(')
          ..write('id: $id, ')
          ..write('notepadId: $notepadId, ')
          ..write('coserId: $coserId, ')
          ..write('label: $label, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('isSent: $isSent, ')
          ..write('isReturned: $isReturned, ')
          ..write('imageBytes: $imageBytes, ')
          ..write('series: $series, ')
          ..write('character: $character, ')
          ..write('survey: $survey')
          ..write(')'))
        .toString();
  }
}

class $NoteItemsTable extends NoteItems
    with TableInfo<$NoteItemsTable, NoteItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_items';
  @override
  VerificationContext validateIntegrity(Insertable<NoteItem> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteItem(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
    );
  }

  @override
  $NoteItemsTable createAlias(String alias) {
    return $NoteItemsTable(attachedDatabase, alias);
  }
}

class NoteItem extends DataClass implements Insertable<NoteItem> {
  final int id;
  final String title;
  const NoteItem({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  NoteItemsCompanion toCompanion(bool nullToAbsent) {
    return NoteItemsCompanion(
      id: Value(id),
      title: Value(title),
    );
  }

  factory NoteItem.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  NoteItem copyWith({int? id, String? title}) => NoteItem(
        id: id ?? this.id,
        title: title ?? this.title,
      );
  NoteItem copyWithCompanion(NoteItemsCompanion data) {
    return NoteItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteItem(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteItem && other.id == this.id && other.title == this.title);
}

class NoteItemsCompanion extends UpdateCompanion<NoteItem> {
  final Value<int> id;
  final Value<String> title;
  const NoteItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  NoteItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<NoteItem> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  NoteItemsCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return NoteItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CoserItemsTable coserItems = $CoserItemsTable(this);
  late final $SurveyItemsTable surveyItems = $SurveyItemsTable(this);
  late final $MemoItemsTable memoItems = $MemoItemsTable(this);
  late final $NoteItemsTable noteItems = $NoteItemsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [coserItems, surveyItems, memoItems, noteItems];
}

typedef $$CoserItemsTableCreateCompanionBuilder = CoserItemsCompanion Function({
  Value<int> id,
  Value<String?> snsId,
  Value<String?> sns,
  Value<String?> email,
});
typedef $$CoserItemsTableUpdateCompanionBuilder = CoserItemsCompanion Function({
  Value<int> id,
  Value<String?> snsId,
  Value<String?> sns,
  Value<String?> email,
});

class $$CoserItemsTableFilterComposer
    extends Composer<_$AppDatabase, $CoserItemsTable> {
  $$CoserItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get snsId => $composableBuilder(
      column: $table.snsId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sns => $composableBuilder(
      column: $table.sns, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));
}

class $$CoserItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $CoserItemsTable> {
  $$CoserItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get snsId => $composableBuilder(
      column: $table.snsId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sns => $composableBuilder(
      column: $table.sns, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));
}

class $$CoserItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoserItemsTable> {
  $$CoserItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get snsId =>
      $composableBuilder(column: $table.snsId, builder: (column) => column);

  GeneratedColumn<String> get sns =>
      $composableBuilder(column: $table.sns, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);
}

class $$CoserItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CoserItemsTable,
    CoserItem,
    $$CoserItemsTableFilterComposer,
    $$CoserItemsTableOrderingComposer,
    $$CoserItemsTableAnnotationComposer,
    $$CoserItemsTableCreateCompanionBuilder,
    $$CoserItemsTableUpdateCompanionBuilder,
    (CoserItem, BaseReferences<_$AppDatabase, $CoserItemsTable, CoserItem>),
    CoserItem,
    PrefetchHooks Function()> {
  $$CoserItemsTableTableManager(_$AppDatabase db, $CoserItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoserItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoserItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoserItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> snsId = const Value.absent(),
            Value<String?> sns = const Value.absent(),
            Value<String?> email = const Value.absent(),
          }) =>
              CoserItemsCompanion(
            id: id,
            snsId: snsId,
            sns: sns,
            email: email,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> snsId = const Value.absent(),
            Value<String?> sns = const Value.absent(),
            Value<String?> email = const Value.absent(),
          }) =>
              CoserItemsCompanion.insert(
            id: id,
            snsId: snsId,
            sns: sns,
            email: email,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CoserItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CoserItemsTable,
    CoserItem,
    $$CoserItemsTableFilterComposer,
    $$CoserItemsTableOrderingComposer,
    $$CoserItemsTableAnnotationComposer,
    $$CoserItemsTableCreateCompanionBuilder,
    $$CoserItemsTableUpdateCompanionBuilder,
    (CoserItem, BaseReferences<_$AppDatabase, $CoserItemsTable, CoserItem>),
    CoserItem,
    PrefetchHooks Function()>;
typedef $$SurveyItemsTableCreateCompanionBuilder = SurveyItemsCompanion
    Function({
  Value<int> id,
  required String question,
  required String options,
  required int choice,
});
typedef $$SurveyItemsTableUpdateCompanionBuilder = SurveyItemsCompanion
    Function({
  Value<int> id,
  Value<String> question,
  Value<String> options,
  Value<int> choice,
});

class $$SurveyItemsTableFilterComposer
    extends Composer<_$AppDatabase, $SurveyItemsTable> {
  $$SurveyItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get choice => $composableBuilder(
      column: $table.choice, builder: (column) => ColumnFilters(column));
}

class $$SurveyItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $SurveyItemsTable> {
  $$SurveyItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get question => $composableBuilder(
      column: $table.question, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get options => $composableBuilder(
      column: $table.options, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get choice => $composableBuilder(
      column: $table.choice, builder: (column) => ColumnOrderings(column));
}

class $$SurveyItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SurveyItemsTable> {
  $$SurveyItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumn<int> get choice =>
      $composableBuilder(column: $table.choice, builder: (column) => column);
}

class $$SurveyItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SurveyItemsTable,
    SurveyItem,
    $$SurveyItemsTableFilterComposer,
    $$SurveyItemsTableOrderingComposer,
    $$SurveyItemsTableAnnotationComposer,
    $$SurveyItemsTableCreateCompanionBuilder,
    $$SurveyItemsTableUpdateCompanionBuilder,
    (SurveyItem, BaseReferences<_$AppDatabase, $SurveyItemsTable, SurveyItem>),
    SurveyItem,
    PrefetchHooks Function()> {
  $$SurveyItemsTableTableManager(_$AppDatabase db, $SurveyItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SurveyItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SurveyItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SurveyItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> question = const Value.absent(),
            Value<String> options = const Value.absent(),
            Value<int> choice = const Value.absent(),
          }) =>
              SurveyItemsCompanion(
            id: id,
            question: question,
            options: options,
            choice: choice,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String question,
            required String options,
            required int choice,
          }) =>
              SurveyItemsCompanion.insert(
            id: id,
            question: question,
            options: options,
            choice: choice,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SurveyItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SurveyItemsTable,
    SurveyItem,
    $$SurveyItemsTableFilterComposer,
    $$SurveyItemsTableOrderingComposer,
    $$SurveyItemsTableAnnotationComposer,
    $$SurveyItemsTableCreateCompanionBuilder,
    $$SurveyItemsTableUpdateCompanionBuilder,
    (SurveyItem, BaseReferences<_$AppDatabase, $SurveyItemsTable, SurveyItem>),
    SurveyItem,
    PrefetchHooks Function()>;
typedef $$MemoItemsTableCreateCompanionBuilder = MemoItemsCompanion Function({
  Value<int> id,
  required int notepadId,
  required int coserId,
  Value<String?> label,
  Value<bool> isFavorite,
  Value<bool> isSent,
  Value<bool> isReturned,
  Value<Uint8List?> imageBytes,
  Value<String?> series,
  Value<String?> character,
  Value<String?> survey,
});
typedef $$MemoItemsTableUpdateCompanionBuilder = MemoItemsCompanion Function({
  Value<int> id,
  Value<int> notepadId,
  Value<int> coserId,
  Value<String?> label,
  Value<bool> isFavorite,
  Value<bool> isSent,
  Value<bool> isReturned,
  Value<Uint8List?> imageBytes,
  Value<String?> series,
  Value<String?> character,
  Value<String?> survey,
});

class $$MemoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $MemoItemsTable> {
  $$MemoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get notepadId => $composableBuilder(
      column: $table.notepadId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get coserId => $composableBuilder(
      column: $table.coserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSent => $composableBuilder(
      column: $table.isSent, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isReturned => $composableBuilder(
      column: $table.isReturned, builder: (column) => ColumnFilters(column));

  ColumnFilters<Uint8List> get imageBytes => $composableBuilder(
      column: $table.imageBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get series => $composableBuilder(
      column: $table.series, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get character => $composableBuilder(
      column: $table.character, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get survey => $composableBuilder(
      column: $table.survey, builder: (column) => ColumnFilters(column));
}

class $$MemoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $MemoItemsTable> {
  $$MemoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get notepadId => $composableBuilder(
      column: $table.notepadId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get coserId => $composableBuilder(
      column: $table.coserId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSent => $composableBuilder(
      column: $table.isSent, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isReturned => $composableBuilder(
      column: $table.isReturned, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<Uint8List> get imageBytes => $composableBuilder(
      column: $table.imageBytes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get series => $composableBuilder(
      column: $table.series, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get character => $composableBuilder(
      column: $table.character, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get survey => $composableBuilder(
      column: $table.survey, builder: (column) => ColumnOrderings(column));
}

class $$MemoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MemoItemsTable> {
  $$MemoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get notepadId =>
      $composableBuilder(column: $table.notepadId, builder: (column) => column);

  GeneratedColumn<int> get coserId =>
      $composableBuilder(column: $table.coserId, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => column);

  GeneratedColumn<bool> get isSent =>
      $composableBuilder(column: $table.isSent, builder: (column) => column);

  GeneratedColumn<bool> get isReturned => $composableBuilder(
      column: $table.isReturned, builder: (column) => column);

  GeneratedColumn<Uint8List> get imageBytes => $composableBuilder(
      column: $table.imageBytes, builder: (column) => column);

  GeneratedColumn<String> get series =>
      $composableBuilder(column: $table.series, builder: (column) => column);

  GeneratedColumn<String> get character =>
      $composableBuilder(column: $table.character, builder: (column) => column);

  GeneratedColumn<String> get survey =>
      $composableBuilder(column: $table.survey, builder: (column) => column);
}

class $$MemoItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MemoItemsTable,
    MemoItem,
    $$MemoItemsTableFilterComposer,
    $$MemoItemsTableOrderingComposer,
    $$MemoItemsTableAnnotationComposer,
    $$MemoItemsTableCreateCompanionBuilder,
    $$MemoItemsTableUpdateCompanionBuilder,
    (MemoItem, BaseReferences<_$AppDatabase, $MemoItemsTable, MemoItem>),
    MemoItem,
    PrefetchHooks Function()> {
  $$MemoItemsTableTableManager(_$AppDatabase db, $MemoItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MemoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MemoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MemoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> notepadId = const Value.absent(),
            Value<int> coserId = const Value.absent(),
            Value<String?> label = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<bool> isSent = const Value.absent(),
            Value<bool> isReturned = const Value.absent(),
            Value<Uint8List?> imageBytes = const Value.absent(),
            Value<String?> series = const Value.absent(),
            Value<String?> character = const Value.absent(),
            Value<String?> survey = const Value.absent(),
          }) =>
              MemoItemsCompanion(
            id: id,
            notepadId: notepadId,
            coserId: coserId,
            label: label,
            isFavorite: isFavorite,
            isSent: isSent,
            isReturned: isReturned,
            imageBytes: imageBytes,
            series: series,
            character: character,
            survey: survey,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int notepadId,
            required int coserId,
            Value<String?> label = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<bool> isSent = const Value.absent(),
            Value<bool> isReturned = const Value.absent(),
            Value<Uint8List?> imageBytes = const Value.absent(),
            Value<String?> series = const Value.absent(),
            Value<String?> character = const Value.absent(),
            Value<String?> survey = const Value.absent(),
          }) =>
              MemoItemsCompanion.insert(
            id: id,
            notepadId: notepadId,
            coserId: coserId,
            label: label,
            isFavorite: isFavorite,
            isSent: isSent,
            isReturned: isReturned,
            imageBytes: imageBytes,
            series: series,
            character: character,
            survey: survey,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MemoItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MemoItemsTable,
    MemoItem,
    $$MemoItemsTableFilterComposer,
    $$MemoItemsTableOrderingComposer,
    $$MemoItemsTableAnnotationComposer,
    $$MemoItemsTableCreateCompanionBuilder,
    $$MemoItemsTableUpdateCompanionBuilder,
    (MemoItem, BaseReferences<_$AppDatabase, $MemoItemsTable, MemoItem>),
    MemoItem,
    PrefetchHooks Function()>;
typedef $$NoteItemsTableCreateCompanionBuilder = NoteItemsCompanion Function({
  Value<int> id,
  required String title,
});
typedef $$NoteItemsTableUpdateCompanionBuilder = NoteItemsCompanion Function({
  Value<int> id,
  Value<String> title,
});

class $$NoteItemsTableFilterComposer
    extends Composer<_$AppDatabase, $NoteItemsTable> {
  $$NoteItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));
}

class $$NoteItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $NoteItemsTable> {
  $$NoteItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));
}

class $$NoteItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $NoteItemsTable> {
  $$NoteItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);
}

class $$NoteItemsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NoteItemsTable,
    NoteItem,
    $$NoteItemsTableFilterComposer,
    $$NoteItemsTableOrderingComposer,
    $$NoteItemsTableAnnotationComposer,
    $$NoteItemsTableCreateCompanionBuilder,
    $$NoteItemsTableUpdateCompanionBuilder,
    (NoteItem, BaseReferences<_$AppDatabase, $NoteItemsTable, NoteItem>),
    NoteItem,
    PrefetchHooks Function()> {
  $$NoteItemsTableTableManager(_$AppDatabase db, $NoteItemsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NoteItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NoteItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NoteItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
          }) =>
              NoteItemsCompanion(
            id: id,
            title: title,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
          }) =>
              NoteItemsCompanion.insert(
            id: id,
            title: title,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$NoteItemsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NoteItemsTable,
    NoteItem,
    $$NoteItemsTableFilterComposer,
    $$NoteItemsTableOrderingComposer,
    $$NoteItemsTableAnnotationComposer,
    $$NoteItemsTableCreateCompanionBuilder,
    $$NoteItemsTableUpdateCompanionBuilder,
    (NoteItem, BaseReferences<_$AppDatabase, $NoteItemsTable, NoteItem>),
    NoteItem,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CoserItemsTableTableManager get coserItems =>
      $$CoserItemsTableTableManager(_db, _db.coserItems);
  $$SurveyItemsTableTableManager get surveyItems =>
      $$SurveyItemsTableTableManager(_db, _db.surveyItems);
  $$MemoItemsTableTableManager get memoItems =>
      $$MemoItemsTableTableManager(_db, _db.memoItems);
  $$NoteItemsTableTableManager get noteItems =>
      $$NoteItemsTableTableManager(_db, _db.noteItems);
}
