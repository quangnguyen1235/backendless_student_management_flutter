import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter_app/src/resource/database/app_database.dart';
export 'package:backendless_sdk/backendless_sdk.dart';
export 'major_dao.dart';
export 'class_dao.dart';
export 'nation_dao.dart';
export 'sub_dao.dart';
export 'province_dao.dart';
export 'student_dao.dart';

abstract class Dao<T>{
  late String tableName;
  late AppDatabase appDatabase;
  Future<List<T>> read({DataQueryBuilder? queryBuilder});
}
