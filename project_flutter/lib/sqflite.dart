import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class SqlDb{
  static Database _db;
  Future<Database> get db async{
    if(_db == null){
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }
  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "notes.db"); //databasepath/notes.db
    Database mydb = await openDatabase(path, onCreate: _onCreate);
    return mydb;
  }
_onCreate(Database db, int version)async{
  await db.execute('''
       CREAT TABLE "notes"(
         'id' INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
         'title' TEXT NOT NULL,
         'note' TEXT NOT NULL
       )
 ''');
}
 readData(String sql) async{ // جلب البيانات من الداتا بيز
  Database mydb = await db;
  List<Map> response = await mydb.rawQuery(sql);
  return response; 
 }
  insertData(String sql) async{ // ادخال البيانات الى الداتا بيز
  Database mydb = await db;
  int response = await mydb.rawInsert(sql);
  return response; 
 }
 updateData(String sql) async{ // تحديث البيانات الى الداتا بيز
  Database mydb = await db;
  int response = await mydb.rawUpdate(sql);
  return response; 
 }
 deletData(String sql) async{ // حذف البيانات الى الداتا بيز
  Database mydb = await db;
  int response = await mydb.rawDelete(sql);
  return response; 
 }
}
