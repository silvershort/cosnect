// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Co∽nect`
  String get app_name {
    return Intl.message(
      'Co∽nect',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Press the back button again to exit.`
  String get back_button_again_msg {
    return Intl.message(
      'Press the back button again to exit.',
      name: 'back_button_again_msg',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `X`
  String get x {
    return Intl.message(
      'X',
      name: 'x',
      desc: '',
      args: [],
    );
  }

  /// `SNS`
  String get sns {
    return Intl.message(
      'SNS',
      name: 'sns',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get twitter {
    return Intl.message(
      'Twitter',
      name: 'twitter',
      desc: '',
      args: [],
    );
  }

  /// `Instagram`
  String get instagram {
    return Intl.message(
      'Instagram',
      name: 'instagram',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get nickname {
    return Intl.message(
      'Nickname',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `Series`
  String get series {
    return Intl.message(
      'Series',
      name: 'series',
      desc: '',
      args: [],
    );
  }

  /// `Character`
  String get character {
    return Intl.message(
      'Character',
      name: 'character',
      desc: '',
      args: [],
    );
  }

  /// `The event is in progress!`
  String get event_progress_msg {
    return Intl.message(
      'The event is in progress!',
      name: 'event_progress_msg',
      desc: '',
      args: [],
    );
  }

  /// `All Events`
  String get all_events {
    return Intl.message(
      'All Events',
      name: 'all_events',
      desc: '',
      args: [],
    );
  }

  /// `Memory`
  String get memory {
    return Intl.message(
      'Memory',
      name: 'memory',
      desc: '',
      args: [],
    );
  }

  /// `Write`
  String get write {
    return Intl.message(
      'Write',
      name: 'write',
      desc: '',
      args: [],
    );
  }

  /// `Photo`
  String get photo {
    return Intl.message(
      'Photo',
      name: 'photo',
      desc: '',
      args: [],
    );
  }

  /// `Detail view`
  String get detail_view {
    return Intl.message(
      'Detail view',
      name: 'detail_view',
      desc: '',
      args: [],
    );
  }

  /// `Upload Photo`
  String get upload_photo {
    return Intl.message(
      'Upload Photo',
      name: 'upload_photo',
      desc: '',
      args: [],
    );
  }

  /// `Re-upload Photo`
  String get re_upload_photo {
    return Intl.message(
      'Re-upload Photo',
      name: 're_upload_photo',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the SNS or email address to receive the photo.`
  String get information_input_msg {
    return Intl.message(
      'Please enter the SNS or email address to receive the photo.',
      name: 'information_input_msg',
      desc: '',
      args: [],
    );
  }

  /// `Co∽nect is an app that allows you to record the SNS or email address of a cosplayer to deliver photos taken at the event.`
  String get app_tutorial_msg1 {
    return Intl.message(
      'Co∽nect is an app that allows you to record the SNS or email address of a cosplayer to deliver photos taken at the event.',
      name: 'app_tutorial_msg1',
      desc: '',
      args: [],
    );
  }

  /// `You can create a simple questionnaire to receive information that was difficult to ask one by one.`
  String get app_tutorial_msg2 {
    return Intl.message(
      'You can create a simple questionnaire to receive information that was difficult to ask one by one.',
      name: 'app_tutorial_msg2',
      desc: '',
      args: [],
    );
  }

  /// `If you register a two-shot photo with a cosplayer, you can recall the memories of that day in an album format.`
  String get app_tutorial_msg3 {
    return Intl.message(
      'If you register a two-shot photo with a cosplayer, you can recall the memories of that day in an album format.',
      name: 'app_tutorial_msg3',
      desc: '',
      args: [],
    );
  }

  /// `Notepad`
  String get notepad {
    return Intl.message(
      'Notepad',
      name: 'notepad',
      desc: '',
      args: [],
    );
  }

  /// `Please create a new notepad.`
  String get notepad_new_create_msg {
    return Intl.message(
      'Please create a new notepad.',
      name: 'notepad_new_create_msg',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the name of the notepad.`
  String get notepad_create_name_msg {
    return Intl.message(
      'Please enter the name of the notepad.',
      name: 'notepad_create_name_msg',
      desc: '',
      args: [],
    );
  }

  /// `ex) July SeoulComic, 24th G-Star, etc...`
  String get notepad_create_tool_tip {
    return Intl.message(
      'ex) July SeoulComic, 24th G-Star, etc...',
      name: 'notepad_create_tool_tip',
      desc: '',
      args: [],
    );
  }

  /// `Please select a note template.`
  String get template_select_msg {
    return Intl.message(
      'Please select a note template.',
      name: 'template_select_msg',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
