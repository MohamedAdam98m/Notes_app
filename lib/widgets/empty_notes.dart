import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EmptyNotes extends StatelessWidget {
  const EmptyNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/img/notes.png",
          width: Get.mediaQuery.size.width,
        ),
        Text(
          "noNotes".tr,
          style: const TextStyle(
            fontSize: 25,
            // color: Get.theme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
