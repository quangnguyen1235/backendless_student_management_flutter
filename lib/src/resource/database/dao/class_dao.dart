import 'package:flutter_app/src/resource/database/app_database.dart';
import 'package:flutter_app/src/resource/database/dao/dao.dart';
import 'package:flutter_app/src/resource/model/class_model.dart';

class ClassDao implements Dao<ClassModel>{
  ClassDao._();

  static ClassDao? _instance;

  factory ClassDao() {
    return _instance ??= ClassDao._();
  }

  @override
  AppDatabase appDatabase = AppDatabase();

  @override
  String tableName = 'HS_LOP';

  @override
  Future<List<ClassModel>> find({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<ClassModel> result = [];
    // TODO: implement find
    final response = await appDatabase.find(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => ClassModel.fromJson(e)).toList();
    }
    return result;
  }

}