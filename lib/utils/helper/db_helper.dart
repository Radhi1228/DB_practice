import 'package:db_practice/screens/category/model/category_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? database;

  Future<Database> checkDB() async {
    /*
    * if (database == null) {
      database = await initDB();
    }*/
    database ??= await initDB();
    return database!;
  }

  Future<Database> initDB() async {
    String folder = await getDatabasesPath();
    String path = "$folder/database.db";
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query =
            "CREATE TABLE category(cid INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)";
        db.execute(query);
      },
    );
  }

  Future<void> insertDB(String category) async {
    database = await checkDB();
    String query = "INSERT INTO category(name) VALUES ('$category')";
    database!.rawInsert(query);
  }

  Future<List<CategoryModel>> readDB() async {
    database = await checkDB();
    String query = "SELECT * FROM category";
    List<Map> l1 = await database!.rawQuery(query);

    List<CategoryModel> categoryList =
        l1.map((e) => CategoryModel.mapToModel(e)).toList();

    return categoryList;
  }

  Future<void> updateDB(String name, int id) async {
    database = await checkDB();
    String query = "UPDATE category SET name = '$name' WHERE '$id'";
    database!.rawUpdate(query);
  }

  Future<void> deleteDB(int id) async {
    database = await checkDB();
    String query = "DELETE FROM category WHERE '$id'";
    database!.rawDelete(query);
  }
}
