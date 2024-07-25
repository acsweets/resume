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

  /// `home`
  String get title {
    return Intl.message(
      'home',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `info`
  String get info {
    return Intl.message(
      'info',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `education`
  String get education {
    return Intl.message(
      'education',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `schoolName`
  String get schoolName {
    return Intl.message(
      'schoolName',
      name: 'schoolName',
      desc: '',
      args: [],
    );
  }

  /// `startDate`
  String get startDate {
    return Intl.message(
      'startDate',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `endDate`
  String get endDate {
    return Intl.message(
      'endDate',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `discipline`
  String get discipline {
    return Intl.message(
      'discipline',
      name: 'discipline',
      desc: '',
      args: [],
    );
  }

  /// `course`
  String get course {
    return Intl.message(
      'course',
      name: 'course',
      desc: '',
      args: [],
    );
  }

  /// `evaluate`
  String get evaluate {
    return Intl.message(
      'evaluate',
      name: 'evaluate',
      desc: '',
      args: [],
    );
  }

  /// `skills`
  String get skills {
    return Intl.message(
      'skills',
      name: 'skills',
      desc: '',
      args: [],
    );
  }

  /// `project`
  String get project {
    return Intl.message(
      'project',
      name: 'project',
      desc: '',
      args: [],
    );
  }

  /// `experience`
  String get experience {
    return Intl.message(
      'experience',
      name: 'experience',
      desc: '',
      args: [],
    );
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `age`
  String get age {
    return Intl.message(
      'age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `phoneNumber`
  String get phoneNumber {
    return Intl.message(
      'phoneNumber',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `degree`
  String get degree {
    return Intl.message(
      'degree',
      name: 'degree',
      desc: '',
      args: [],
    );
  }

  /// `expect`
  String get expect {
    return Intl.message(
      'expect',
      name: 'expect',
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
      Locale.fromSubtags(languageCode: 'zh'),
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
