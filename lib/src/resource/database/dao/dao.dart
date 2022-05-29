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
  /// Tên bảng
  late String tableName;

  /// Lớp AppDataBase để thao tác với CSDL
  late AppDataBase appDatabase;

  /// Phương thức này dùng để query CSDL trả ra List<T>
  ///
  /// Cac biến:
  ///   queryBuilder: điều kiện đầu vào (có thể có hoặc không).
  Future<List<T>> read({DataQueryBuilder? queryBuilder});
}
