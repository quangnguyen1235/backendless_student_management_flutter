import 'package:flutter_app/src/resource/resource.dart';

class StudentDao implements Dao<StudentModel>{
  StudentDao._();

  static StudentDao? _instance;

  factory StudentDao() {
    return _instance ??= StudentDao._();
  }

  @override
  AppDatabase appDatabase = AppDatabase();

  @override
  String tableName = 'HS_SINHVIEN';

  @override
  Future<List<StudentModel>> read({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<StudentModel> result = [];
    // TODO: implement find
    final response = await appDatabase.read(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => StudentModel.fromJson(e)).toList();
    }
    return result;
  }

}