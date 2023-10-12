import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:notes_app/controller/setting_page_controller.dart';
import 'package:notes_app/functions/functions.dart';
import 'package:notes_app/serviecs/my_services.dart';

String? themePref = MyServices().getSharedPref.getString("appTheme");

class ThemeController extends GetxController {
  ThemeMode themeMode = themePref == "dark"
      ? ThemeMode.dark
      : themePref == "light"
          ? ThemeMode.light
          : ThemeMode.system;

  setAppTheme(String? themeCode) {
    switch (themeCode) {
      case "dark":
        Get.changeThemeMode(ThemeMode.dark);

      // update();
      case "light":
        Get.changeThemeMode(ThemeMode.light);
      // update();
      case "system":
        Get.changeThemeMode(ThemeMode.system);
      // update();
    }
    update();
  }

  ThemeData get getLightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: "Alexandria",
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.light,
          backgroundColor: HexColor("EEEEEE"),
          accentColor: HexColor("176B87"),
          cardColor: HexColor("EEEEEE"),
          primarySwatch: getColorMaterial(HexColor("053B50")),
        ),
      );

  ThemeData get getDarkTheme => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: "Alexandria",
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: HexColor("040D12"),
        ),
      );

  String get getFontFamily =>
      sharedPref.get("appLang") == "arabic" ? "Alexandria" : "Anton";
}
