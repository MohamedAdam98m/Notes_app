import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/view/edit_note.dart';
import '../controller/home_page_controller.dart';

class SingleNote extends StatelessWidget {
  final HomePageController controller;
  final String title;
  final String note;
  final String date;
  final int index;

  const SingleNote(this.controller,
      {super.key,
      required this.index,
      required this.title,
      required this.note,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () => Get.to(
        () => EditNote(
          id: int.parse("${controller.notes[index]['id']}"),
          title: title,
          note: note,
        ),
      ),
      child: Card(
          elevation: 2,
          // margin: const EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(9, 10, 9, 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      title != "" ? title : "noTitle".tr,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                    const SizedBox(
                      height: 10,
                      width: 40,
                      child: Divider(),
                    ),
                    Text(
                      note,
                      style: const TextStyle(fontSize: 10),
                      maxLines: 4,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () async {
                            int response = await controller
                                .deleteNote("${controller.notes[index]['id']}");
                            print(response);
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red[900]!,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
