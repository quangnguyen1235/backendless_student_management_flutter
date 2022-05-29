import 'package:flutter_app/src/resource/resource.dart';

class SubDao implements Dao<SubModel>{
  SubDao._();

  static SubDao? _instance;

  factory SubDao() {
    return _instance ??= SubDao._();
  }

  @override
  AppDataBase appDatabase = AppDataBase();

  @override
  String tableName = 'HS_DOITUONG';

  @override
  Future<List<SubModel>> read({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<SubModel> result = [];
    // TODO: implement find
    final response = await appDatabase.read(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => SubModel.fromJson(e)).toList();
    }
    return result;
  }

}