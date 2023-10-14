import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:notes_app/controller/home_page_controller.dart';

deleteDialog(String? id, HomePageController controller) {
  Get.defaultDialog(
    title: "popAlert".tr,
    content: Text("deleteDialog".tr),
    textConfirm: "yes".tr,
    textCancel: "cancel".tr,
    onConfirm: () async {
      int response = await controller.deleteNote(id);
      print(response);
      // Get.back();
    },
    onCancel: () => Get.back(),
    barrierDismissible: false,
  );
  return true;
}
