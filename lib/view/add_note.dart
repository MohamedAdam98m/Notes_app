import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controller/add_note_controller.dart';
import 'package:notes_app/view/home_page.dart';

import '../widgets/appBar_btn.dart';
import '../widgets/note_text_field.dart';

class AddNote extends GetView<AddNoteController> {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 140,
          leading: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBarBtn(
                  iconData: Icons.arrow_back_ios,
                  onTap: () {
                    Get.offAll(() => const HomePage());
                  }),
              // AppBarBtn(
              //   iconData: Icons.save,
              //   onTap: () async => await controller.addNote(),
              // )
            ],
          )),
      floatingActionButton: ButtonBar(
        alignment: MainAxisAlignment.center,
        buttonPadding: const EdgeInsets.all(25),
        children: [
          ElevatedButton(
            onPressed: () async => await controller.addNote(),
            child: Text("add".tr),
          ),
          TextButton(onPressed: () => Get.back(), child: Text("cancel".tr)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            NoteTextField(
              ctrl: controller.titleCtrl,
              title: "title".tr,
            ),
            const SizedBox(
              height: 15,
            ),
            NoteTextField(
              ctrl: controller.noteCtrl,
              title: "note".tr,
              maxLength: 500,
              maxLines: 15,
              autofocus: true,
            ),
            const SizedBox(
              height: 18,
            ),
          ]),
        ),
      ),
    );
  }
}
