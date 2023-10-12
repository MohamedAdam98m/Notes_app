import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/add_note_controller.dart';
import 'package:notes_app/controller/edit_note_controller.dart';
import 'package:notes_app/controller/home_page_controller.dart';
import 'package:notes_app/controller/setting_page_controller.dart';
import 'package:notes_app/locale/locale_controller.dart';

import 'package:notes_app/serviecs/my_services.dart';
import 'package:notes_app/theme/theme_controller.dart';

Future inilServices() async {
  await Get.putAsync(() => MyServices().init());
  // Get.put(ThemeController());
  // Get.put(SettingPageController());
  // Get.put(LocaleController());
  Get.lazyPut(() => ThemeController());
  Get.put(SettingPageController());
  Get.lazyPut(() => LocaleController());
  Get.lazyPut(() => EditNoteController(), fenix: true);
  Get.put(HomePageController());
  // await Get.putAsync(() => HomePageController().init());

  Get.lazyPut(() => AddNoteController(), fenix: true);
}

MaterialColor getColorMaterial(Color color) {
  final List<Color> colors = <Color>[
    color,
    color.withOpacity(0.8),
    color.withOpacity(0.6),
    color.withOpacity(0.4),
    color.withOpacity(0.2),
    color.withOpacity(0.1),
    color.withOpacity(0.05),
  ];

  return MaterialColor(color.value, <int, Color>{
    50: colors[6],
    100: colors[5],
    200: colors[4],
    300: colors[3],
    400: colors[2],
    500: colors[1],
    600: colors[0],
    700: colors[0],
    800: colors[0],
    900: colors[0],
  });
}
