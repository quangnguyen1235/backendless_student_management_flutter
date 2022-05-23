import 'package:flutter_app/src/resource/resource.dart';

class NationDao implements Dao<NationModel>{
  NationDao._();

  static NationDao? _instance;

  factory NationDao() {
    return _instance ??= NationDao._();
  }

  @override
  AppDatabase appDatabase = AppDatabase();

  @override
  String tableName = 'HS_DANTOC';

  @override
  Future<List<NationModel>> read({DataQueryBuilder? queryBuilder}) async {
    // TODO: implement find
    List<NationModel> result = [];
    // TODO: implement find
    final response = await appDatabase.read(tableName, queryBuilder: queryBuilder);
    if(response != null){
      result = response.map((e) => NationModel.fromJson(e)).toList();
    }
    return result;
  }

}