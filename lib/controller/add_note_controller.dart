import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_page_controller.dart';
import 'package:jiffy/jiffy.dart';

import '../database/my_db.dart';
import '../view/home_page.dart';
import '../widgets/snack_bar.dart';

HomePageController homeCtrl = Get.find();

class AddNoteController extends GetxController {
  final MyDB _db = MyDB();
  // late Jiffy jiffy ;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController noteCtrl = TextEditingController();
  String date = "${Jiffy.now().MMMd} , ${Jiffy.now().jm}";
  // var date = "${DateTime.now().day} , ${DateTime.now().month}";
  // var date = Jiffy.now().yMMMdjm.toString();
  // MEd , jm
  // format(pattern: "dd MMM, h:mm")

  Future addNote() async {
    int? response = await _db.insertData("notes", {
      "title": titleCtrl.text,
      "note": noteCtrl.text,
      "date": date,
    });
    if (response != null) {
      await homeCtrl.getNotes();
      Get.offAll(() => const HomePage());
      noteSnackBar(type: "add");
    } else {
      print(response);
    }
    update();
    // return response;
  }
}
