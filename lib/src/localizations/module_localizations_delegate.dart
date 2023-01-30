// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:multiple_localization/multiple_localization.dart';

import 'messages/messages_all.dart';
import 'module_localization.dart';

class ArchitectureLocalizationsDelegate
    extends LocalizationsDelegate<ModuleLocalizations> {
  const ArchitectureLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);

  @override
  Future<ModuleLocalizations> load(Locale locale) => MultipleLocalizations.load(
      initializeMessages, locale, (l) => ModuleLocalizations.load(locale),
      setDefaultLocale: true);

  @override
  bool shouldReload(LocalizationsDelegate<ModuleLocalizations> old) => false;
}
