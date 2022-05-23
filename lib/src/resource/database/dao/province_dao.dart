import 'package:flutter_app/src/resource/resource.dart';

class ProvinceDao implements Dao<ProvinceModel>{
  ProvinceDao._();

  static ProvinceDao? _instance;

  factory ProvinceDao() {
    return _instance ??= ProvinceDao._();
  }

  @override
  AppDatabase appDatabase = AppDatabase();

  @override
  String tableName = 'HS_TINH';

  @override
  Future<List<ProvinceModel>> find({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<ProvinceModel> result = [];
    // TODO: implement find
    final response = await appDatabase.find(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => ProvinceModel.fromJson(e)).toList();
    }
    return result;
  }

}