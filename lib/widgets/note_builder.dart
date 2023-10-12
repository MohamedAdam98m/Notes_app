import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import 'single_note.dart';

class NoteBuilder extends StatelessWidget {
  final HomePageController controller;

  const NoteBuilder(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: Get.mediaQuery.size.width / 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      itemCount: controller.notes.length,
      itemBuilder: (context, index) {
        // بالامكان ارسال الكنترولر فقط واستدعاء باقي المتغيرات من خلاله
        return SingleNote(
          controller,
          title: "${controller.notes[index]['title']}",
          note: "${controller.notes[index]['note']}",
          date: "${controller.notes[index]['date']}",
          index: index,
        );
      },
    );
  }
}