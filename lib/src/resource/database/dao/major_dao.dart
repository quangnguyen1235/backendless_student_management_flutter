import 'package:flutter_app/src/resource/database/app_database.dart';
import 'package:flutter_app/src/resource/database/dao/dao.dart';
import 'package:flutter_app/src/resource/model/major_model.dart';

class MajorDao implements Dao<MajorModel>{
  MajorDao._();

  static MajorDao? _instance;

  factory MajorDao() {
    return _instance ??= MajorDao._();
  }

  @override
  AppDatabase appDatabase = AppDatabase();

  @override
  String tableName = 'HS_NGANH';

  @override
  Future<List<MajorModel>> read({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<MajorModel> result = [];
    // TODO: implement find
    final response = await appDatabase.read(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => MajorModel.fromJson(e)).toList();
    }
    return result;
  }

}