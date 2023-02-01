// coverage:ignore-file

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'messages/messages_all.dart';

class ModuleLocalizations {
  static Future<ModuleLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return ModuleLocalizations();
    });
  }

  static ModuleLocalizations? of(BuildContext context) {
    return Localizations.of<ModuleLocalizations>(context, ModuleLocalizations);
  }

  final failures = _MessageFailures();
}

class _MessageFailures {
  String get defaultFailureMessage =>
      Intl.message('', name: 'defaultFailureMessage');
  String get noConnectionFailureMessage =>
      Intl.message('', name: 'noConnectionFailureMessage');
}
