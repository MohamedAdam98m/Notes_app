import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
// import '../database/my_db.dart';

class MyServices extends GetxService {
  static late SharedPreferences _sharedPref;
  // MyDB _db = MyDB();

  SharedPreferences get getSharedPref => _sharedPref;
  // MyDB get getDb => _db;

  Future<MyServices> init() async {
    _sharedPref = await SharedPreferences.getInstance();
    // _db = MyDB();

    return this;
  }

  // @override
  // void onReady() {
  //   _db = MyDB();
  //   super.onReady();
  // }

  // @override
  // void onInit() {
  //   _db = MyDB();
  //   super.onInit();
  // }
}
