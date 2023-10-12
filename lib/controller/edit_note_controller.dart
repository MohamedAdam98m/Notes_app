import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:notes_app/controller/home_page_controller.dart';
import 'package:notes_app/database/my_db.dart';

import '../view/home_page.dart';
import '../widgets/snack_bar.dart';

class EditNoteController extends GetxController {
  final MyDB _db = MyDB();
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController noteCtrl = TextEditingController();
  String newDate = "${Jiffy.now().MMMd} , ${Jiffy.now().jm}";
  bool enabled = false;

  startEdit() {
    enabled = !enabled;
    update();
  }

  saveEdit(int id) async {
    HomePageController controller = Get.find();
    var respose = await _db.updateData(
        table: "notes",
        values: {
          'title': titleCtrl.text,
          "note": noteCtrl.text,
          "date": newDate
        },
        where: "`id` = $id");
    if (respose != null) {
      controller.getNotes();
      Get.offAll(() => const HomePage());
      noteSnackBar(type: "edit");
    }

    print(respose);
    update();
  }
}
