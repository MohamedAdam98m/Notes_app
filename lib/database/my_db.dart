import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDB {
  final String _dbName = "notesApp.db";
  final String _tableName = "notes";
  static Database? _db;

  get getDb async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    }
    return _db;
  }

  initDb() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, _dbName);
    Database? db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );

    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(// تمت اضافة العنوان في التحديث
        ''' CREATE TABLE `$_tableName` (`id` INTEGER NOT NULL PRIMARY KEY ,`title` TEXT , `note` TEXT , `date` TEXT)
''').whenComplete(() => print("CREATE DB =================="));
  }

//   _onUpgrade(Database db, int oldVer, int newVer) async {
//     await deleteAllData();
//     await db.execute(
//         ''' CREATE TABLE `notes` (`id` INTEGER NOT NULL PRIMARY KEY ,`title` TEXT , `note` TEXT , `date` TEXT)
// ''').whenComplete(() => print("Upgrade DB =================="));
//   }

  Future<List<Map<String, Object?>>?> readData(String table,
      {String? where}) async {
    Database? db = await getDb;
    List<Map<String, Object?>>? response;
    try {
      response = await db!.query(table, where: where);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int?> insertData(String table, Map<String, Object?> values) async {
    Database? db = await getDb;
    int? response;
    try {
      response = await db!.insert(table, values);

      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int?> updateData({required String table, required Map<String, Object?> values , required String where}) async {
    Database? db = await getDb;
    int? response;
    try {
      response = await db!.update(table, values , where: where);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<int?> deleteData(String table, String where) async {
    Database? db = await getDb;
    int? response;
    try {
      response = await db!.delete(table, where: where);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
    // return res;
  }

  Future deleteAllData() async {
    // String dbPath = await getDatabasesPath();
    // String path = join(dbPath, _dbName);
    // await deleteDatabase(path);
    // print("Database Deleted ====================");

    Database db = await getDb;
    var response = await db.delete("$_tableName");
    print(response);
  }
}
