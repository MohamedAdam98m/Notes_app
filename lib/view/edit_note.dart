import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/home_page.dart';

import '../controller/edit_note_controller.dart';
import '../widgets/appBar_btn.dart';
import '../widgets/floating_acttion_btn.dart';
import '../widgets/note_text_field.dart';

class EditNote extends GetView<EditNoteController> {
  final int id;
  final String title;
  final String note;

  EditNote(
      {required this.id, required this.title, required this.note, super.key}) {
    controller.titleCtrl.text = title;
    controller.noteCtrl.text = note;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditNoteController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
            leadingWidth: 140,
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppBarBtn(
                    iconData: Icons.arrow_back_ios,
                    onTap: () => Get.offAll(() => const HomePage())),
                // AppBarBtn(
                //   iconData: Icons.edit,
                //   onTap: () => controller.startEdit(),
                // )
              ],
            )),
        floatingActionButton: controller.enabled
            ? ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => controller.saveEdit(id),
                    child: Text("save".tr),
                  ),
                  TextButton(
                    onPressed: () => Get.offAll(() => const HomePage()),
                    child: Text("cancel".tr),
                  ),
                ],
              )
            : FloatingActionBtn(
                onTap: () => controller.startEdit(),
                iconData: Icons.edit_note,
              ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              NoteTextField(
                ctrl: controller.titleCtrl,
                title: "title".tr,
                enabled: controller.enabled,
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
                enabled: controller.enabled,
              ),
              const SizedBox(
                height: 18,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
