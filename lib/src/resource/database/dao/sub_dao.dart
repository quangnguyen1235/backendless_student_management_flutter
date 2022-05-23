import 'package:flutter_app/src/resource/resource.dart';

class SubDao implements Dao<SubModel>{
  SubDao._();

  static SubDao? _instance;

  factory SubDao() {
    return _instance ??= SubDao._();
  }

  @override
  AppDatabase appDatabase = AppDatabase();

  @override
  String tableName = 'HS_DOITUONG';

  @override
  Future<List<SubModel>> find({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<SubModel> result = [];
    // TODO: implement find
    final response = await appDatabase.find(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => SubModel.fromJson(e)).toList();
    }
    return result;
  }

}