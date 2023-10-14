import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

exitDialog() {
  Get.defaultDialog(
    title: "popAlert".tr,
    content: Text("exitDialog".tr),
    textConfirm: "yes".tr,
    textCancel: "cancel".tr,
    onConfirm: () => exit(0),
    onCancel: () => Get.back(),
    barrierDismissible: false,
  );
  return true;
}


