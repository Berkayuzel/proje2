import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dbözet.dart';

class DBHelper{
  static Database _db;
  static const ID = 'id';
  static const MIKTAR = 'miktar';
  static const NEDEN = 'neden';
  static const TABLE = 'Ozet';
  static const DB_NAME = 'ozet.db';
  Future<Database> get db async{
    if(_db!=null){
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  initDb() async{
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db= await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db, int version) async{
    await db.execute('CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY AUTOINCREMENT, $NEDEN TEXT,$MIKTAR INTEGER)');
  }
  Future<Ozet> save(Ozet ozet) async{
    var dbClient = await db;
    ozet.miktar = await dbClient.insert(TABLE, ozet.toMap());
    return ozet;

  }
  Future<List<Ozet>> getOzet()async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE,columns: [ID,MIKTAR,NEDEN]);
    List<Ozet> ozet = [];
    if(maps.length>0){
      for(int i=0; i<maps.length; i++){
        ozet.add(Ozet.fromMap(maps[i]));
      }
    }
    return ozet;
  }
  Future close()async{
    var dbClient =await db;
    dbClient.close();
  }
}