import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/functions/functions.dart';
import 'package:notes_app/locale/my_translation.dart';
import 'package:notes_app/locale/locale_controller.dart';
import 'package:notes_app/theme/theme_controller.dart';
import 'package:notes_app/view/home_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await inilServices();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "NotesApp",
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: LocaleController().appLocale,
      theme: ThemeController().getLightTheme,
      darkTheme: ThemeController().getDarkTheme,
      themeMode: ThemeController().themeMode,
      home: const HomePage(),
    );
  }
}
