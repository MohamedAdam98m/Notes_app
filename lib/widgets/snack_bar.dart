import 'package:get/get.dart';

noteSnackBar({required String type}) {
  switch (type) {
    case "add":
      Get.snackbar(
        "success".tr,
        "addNewNoteMsg".tr,
        duration: const Duration(seconds: 1),
      );
    case "delete":
      Get.snackbar(
        "success".tr,
        "deleteNoteMsg".tr,
        duration: const Duration(seconds: 1),
      );
    case "edit":
      Get.snackbar(
        "success".tr,
        "editNoteMsg".tr,
        duration: const Duration(seconds: 1),
      );
  }
}
