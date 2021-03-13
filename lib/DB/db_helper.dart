import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_lite_app/model/course.dart';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database _db;
  static final String _database_name = 'school.db';
  static final String _table_name = 'courses';
  static final int version = 1;

  Future<Database> createDatabase() async {
    if (_db != null) {
      print('true');
      return _db;
    }
    String path = join(await getDatabasesPath(), _database_name);
    _db = await openDatabase(
      path,
      version: version,
      onCreate: (database, version) async {
        await database.execute(
            "create table $_table_name($ID integer primary key autoincrement, $NAME varchar(50), $CONTENT varchar(255), $HOURS integer )");
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < newVersion) {
          await db
              .execute('alter table $_table_name add column level varchar(50)');
        }
      },
    );
    return _db;
  }

  Future<int> createCourse(Course course) async {
    Database database = await createDatabase();
    // database.rawInsert('insert into $_table_name');
    return database.insert('$_table_name', {
      '$ID': course.id,
      '$NAME': course.name,
      '$CONTENT': course.content,
      '$HOURS': course.hours,
    });
  }

  Future<List> loadAllCourses() async {
    Database database = await createDatabase();
    // database.rawQuery('select * from $_table_name');
    return database.query('$_table_name');
  }

  Future<int> delete(int id) async {
    Database database = await createDatabase();
    return database.delete('$_table_name', where: '$ID=?', whereArgs: [id]);
  }

  Future<int> courseUpdate(Course course) async {
    Database database = await createDatabase();
    return database.update(_table_name, course.toMap(),
        where: '$ID = ?', whereArgs: [course.id]);
  }
}
