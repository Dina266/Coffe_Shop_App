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

  /// `Choose and customize your drinks with simplicity`
  String get onboardingOneTitle {
    return Intl.message(
      'Choose and customize your drinks with simplicity',
      name: 'onboardingOneTitle',
      desc: '',
      args: [],
    );
  }

  /// `You want your drink and you want it your way so be bold and customize the way that makes you the happiest!`
  String get onboardingOneDesc {
    return Intl.message(
      'You want your drink and you want it your way so be bold and customize the way that makes you the happiest!',
      name: 'onboardingOneDesc',
      desc: '',
      args: [],
    );
  }

  /// `No time to waste when you need your coffee`
  String get onboardingTwoTitle {
    return Intl.message(
      'No time to waste when you need your coffee',
      name: 'onboardingTwoTitle',
      desc: '',
      args: [],
    );
  }

  /// `We've crafted a quick and easy way for you to order your favorite coffee or treats thats fast!`
  String get onboardingTwoDesc {
    return Intl.message(
      'We\'ve crafted a quick and easy way for you to order your favorite coffee or treats thats fast!',
      name: 'onboardingTwoDesc',
      desc: '',
      args: [],
    );
  }

  /// `Who doesn't love rewards? We LOVE rewards!`
  String get onboardingThreeTitle {
    return Intl.message(
      'Who doesn\'t love rewards? We LOVE rewards!',
      name: 'onboardingThreeTitle',
      desc: '',
      args: [],
    );
  }

  /// `If you're like us you love getting freebies and rewards! That's why we have the best reward program in the coffee game!`
  String get onboardingThreeDesc {
    return Intl.message(
      'If you\'re like us you love getting freebies and rewards! That\'s why we have the best reward program in the coffee game!',
      name: 'onboardingThreeDesc',
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

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
