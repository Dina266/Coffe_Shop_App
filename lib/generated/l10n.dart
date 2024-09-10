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

  /// `What's included`
  String get whats_included {
    return Intl.message(
      'What\'s included',
      name: 'whats_included',
      desc: '',
      args: [],
    );
  }

  /// `Cup Size`
  String get cupSize {
    return Intl.message(
      'Cup Size',
      name: 'cupSize',
      desc: '',
      args: [],
    );
  }

  /// `Add-Ins`
  String get addIns {
    return Intl.message(
      'Add-Ins',
      name: 'addIns',
      desc: '',
      args: [],
    );
  }

  /// `Sweetener`
  String get sweetener {
    return Intl.message(
      'Sweetener',
      name: 'sweetener',
      desc: '',
      args: [],
    );
  }

  /// `Splenda® packet`
  String get sweetener_subtitle {
    return Intl.message(
      'Splenda® packet',
      name: 'sweetener_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Flavor`
  String get flavor {
    return Intl.message(
      'Flavor',
      name: 'flavor',
      desc: '',
      args: [],
    );
  }

  /// `Pumpkin Spice`
  String get flavorSubtitle {
    return Intl.message(
      'Pumpkin Spice',
      name: 'flavorSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Creamer`
  String get creamer {
    return Intl.message(
      'Creamer',
      name: 'creamer',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get cupSizeSmall {
    return Intl.message(
      'Small',
      name: 'cupSizeSmall',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get cupSizeMedium {
    return Intl.message(
      'Medium',
      name: 'cupSizeMedium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get cupSizeLarge {
    return Intl.message(
      'Large',
      name: 'cupSizeLarge',
      desc: '',
      args: [],
    );
  }

  /// `Normal Ice`
  String get addInsNormalIce {
    return Intl.message(
      'Normal Ice',
      name: 'addInsNormalIce',
      desc: '',
      args: [],
    );
  }

  /// `More Ice`
  String get addInsMoreIce {
    return Intl.message(
      'More Ice',
      name: 'addInsMoreIce',
      desc: '',
      args: [],
    );
  }

  /// `Less Ice`
  String get addInsLessIce {
    return Intl.message(
      'Less Ice',
      name: 'addInsLessIce',
      desc: '',
      args: [],
    );
  }

  /// `Oatmilk`
  String get creamerOatmilk {
    return Intl.message(
      'Oatmilk',
      name: 'creamerOatmilk',
      desc: '',
      args: [],
    );
  }

  /// `Caramel`
  String get creamerCaramel {
    return Intl.message(
      'Caramel',
      name: 'creamerCaramel',
      desc: '',
      args: [],
    );
  }

  /// `Vanilla`
  String get creamerVanilla {
    return Intl.message(
      'Vanilla',
      name: 'creamerVanilla',
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
