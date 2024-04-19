import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizatons {
  final Locale? locale;
 
  AppLocalizatons({required this.locale});
  static AppLocalizatons? of(BuildContext context) {
    return Localizations.of<AppLocalizatons>(context, AppLocalizatons);
  }
static const LocalizationsDelegate<AppLocalizatons> delegates=_AppLocalizatonsdelegate();
  late Map<String, String> _LocalizationString;
  Future loadjsonlanguage() async {
    String jsonstring =
        await rootBundle.loadString("assets/lang/${locale!.languageCode}.json");
    Map<String, dynamic> jsonmap = json.decode(jsonstring);
    _LocalizationString =
        jsonmap.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) => _LocalizationString[key] ?? "";
}

class _AppLocalizatonsdelegate extends LocalizationsDelegate<AppLocalizatons> {
  const _AppLocalizatonsdelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizatons> load(Locale locale) async {
    AppLocalizatons appLocalizatons = AppLocalizatons(locale: locale);
    await appLocalizatons.loadjsonlanguage();
    return appLocalizatons;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizatons> old) {
    return false;
  }
}
Locale? funlocaleResolutionCallback(Locale? devicelocales, Iterable<Locale> supportedLocales){
                  for (var local in supportedLocales) {
                    if (devicelocales != null &&
                        local.languageCode == devicelocales.languageCode) {
                      return devicelocales;
                    }
                  }
                  return supportedLocales.first;
                }
                Iterable<LocalizationsDelegate<dynamic>> localizationsDelegate=[
   AppLocalizatons.delegates,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate, //di
                  GlobalCupertinoLocalizations.delegate
                
                ];