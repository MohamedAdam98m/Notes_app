import 'package:get/get.dart';
import 'package:notes_app/widgets/snack_bar.dart';
// import 'package:notes_app/serviecs/my_services.dart';
import '../database/my_db.dart';

class HomePageController extends GetxController {
  final MyDB _db = MyDB();

  List<Map<String, Object?>> notes = [];
  // @override
  // void onReady() async {
  //   await getNotes();
  //   print("ready===========");
  //   super.onReady();
  // }

  @override
  void onInit() async {
    await _db.initDb();
    await getNotes();
    print("init============");
    update();
    super.onInit();
  }

  Future getNotes() async {
    List<Map<String, Object?>>? response = await _db.readData("notes");
    notes.clear(); // clear all notes to add it agin
    if (response != null) {
      notes.addAll(response.toList());
    }

    update();
  }

  Future deleteNote(String? id) async {
    int? response = await _db.deleteData("notes", "`id`= $id");

    if (response != null) {
      notes.removeWhere((note) => note['id'] == "$id");
      await getNotes();
      Get.back();
      noteSnackBar(type: "delete");
    } else {
      print(response);
    }

    // refresh();
    update();
    return response;
  }

  deleteAllData() async {
    await _db.deleteAllData();
    notes.clear();
    // await _db.initDb();
    // super.onInit();
    update();
  }

  // List<Map<String, Object?>> get notes => _notes;
}
