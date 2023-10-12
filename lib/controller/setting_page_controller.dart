import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../serviecs/my_services.dart';
import '../theme/theme_controller.dart';
import '../locale/locale_controller.dart';

var sharedPref = MyServices().getSharedPref;
String? themeSharedPref = sharedPref.getString("appTheme");
String? langSharedPref = sharedPref.getString("appLang");
ThemeController themeCtrl = Get.find();
LocaleController localeCtrl = Get.find();

class SettingPageController extends GetxController {
  String? _selctedTheme = themeSharedPref == "dark"
      ? "dark"
      : themeSharedPref == "light"
          ? "light"
          : "system";

  String? _selstedLang = langSharedPref == "arabic" ? "arabic" : "english";

  String? get selctedTheme => _selctedTheme;
  String? get selectedLang => _selstedLang;

  setSelectedTheme(String? themeCode) {
    // متغير الثيم في صفحة الاعدادات
    _selctedTheme = themeCode;

    // تعيين قيمة الثيم في الذاكرة الداخلية
    sharedPref.setString("appTheme", "$themeCode");

    // تعيين قيمة الثيم في التطبيق حاليا
    themeCtrl.setAppTheme(themeCode);

    // للاختبار والتاكد فقط
    print("${sharedPref.get("appTheme")}");

    update();
  }

  setSelectedLang(String? langCode) {
    _selstedLang = langCode;

    sharedPref.setString("appLang", "$langCode");

    localeCtrl.setAppLang(langCode);

    print("${sharedPref.get("appLang")}");

    update();
  }

  List<String?> themes = [
    "dark",
    "light",
    "system",
  ];

  List<String?> languages = [
    "arabic",
    "english",
  ];

  List<Map> others = [
    {
      "title": "contact",
      "icon": Image.asset(
        "assets/icons/contact.png",
        height: 20,
      ),
      "onTap": () {},
    },
    {
      "title": "share",
      "icon": Image.asset(
        "assets/icons/share.png",
        height: 20,
      ),
      "onTap": () {},
    },
    // {"title": "",
    // "icon": const Icon(Icons.share),
    // "onTap": () {},
    // },
  ];
}
