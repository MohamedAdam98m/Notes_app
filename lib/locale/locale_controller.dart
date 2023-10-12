import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/serviecs/my_services.dart';

var langPref = MyServices().getSharedPref;
String? _langPref = langPref.getString("appLang");

class LocaleController extends GetxController {
  Locale? appLocale = _langPref == "arabic"
      ? const Locale("ar")
      : _langPref == "english"
          ? const Locale("en")
          : Get.deviceLocale;

  setAppLang(String? langCode) {
    switch (langCode) {
      case "arabic":
        Get.updateLocale(const Locale("ar"));
      case "english":
        Get.updateLocale(const Locale("en"));
    }
    update();
  }
}
