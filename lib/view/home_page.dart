import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/home_page_controller.dart';
import 'package:notes_app/view/add_note.dart';
import 'package:notes_app/view/settings_page.dart';
import 'package:notes_app/widgets/floating_acttion_btn.dart';

import '../widgets/note_builder.dart';
import '../widgets/empty_notes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            _popMenuBtn(),
          ],
        ),
        floatingActionButton: FloatingActionBtn(
          iconData: Icons.edit,
          onTap: () => Get.to(() => const AddNote()),
        ),
        body: WillPopScope(
          onWillPop: () async {
            Get.defaultDialog(title: "popAlert".tr);
            return true;
          },
          child: GetBuilder<HomePageController>(
              // init: HomePageController(),
              builder: (controller) {
            return controller.notes.isEmpty
                ? const EmptyNotes()
                : NoteBuilder(controller);
          }),
        ));
  }
}

Card _popMenuBtn() {
  HomePageController controller = Get.find();
  return Card(
    child: PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Text("setting".tr),
        ),
        PopupMenuItem(
          value: 2,
          child: Text("deleteAllData".tr),
        )
      ],
      onSelected: (value) {
        switch (value) {
          case 1:
            Get.to(() => const SettingsPage());
            break;
          case 2:
            controller.deleteAllData();
        }
      },
    ),
  );
}
