import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart' as log;

const String BACKEND_DOMAIN = 'regalbehavior.backendless.app';
const String APPLICATION_ID = 'F569DB07-7FF4-3326-FF60-EBD2506F9E00';
const String ANDROID_API_KEY = 'D4BD3656-A27A-47EB-A01E-C2E904E681A3';
const String IOS_API_KEY = '7EAC864C-994A-40C6-A0A1-313526A2CE10';
const String JS_API_KEY = '175E8A6D-9F95-41EF-A2E7-63193B8B9CC4';

class AppDatabase {
  AppDatabase._();

  static AppDatabase? _instance;

  static log.Logger logger = log.Logger();

  factory AppDatabase() {
    return _instance ??= AppDatabase._();
  }

  Future<bool> initDataBase() async {
    await Backendless.initApp(
      applicationId: APPLICATION_ID,
      androidApiKey: ANDROID_API_KEY,
      iosApiKey: IOS_API_KEY,
      jsApiKey: JS_API_KEY,
      customDomain: BACKEND_DOMAIN,
    );
    final _success = await Backendless.isInitialized();
    logger.i(_success == true
        ? 'CONNECT DATABASE SUCCESS'
        : 'CONNECT DATABASE FAILED');
    return _success == true;
  }

  Future<List<Map<dynamic, dynamic>?>?> find(String tableName,
      {DataQueryBuilder? queryBuilder}) async {
    logger.d('FIND: $tableName\nQUERY: $queryBuilder');
    List<Map<dynamic, dynamic>?>? data;
    try {
      data = await Backendless.data.of(tableName).find(queryBuilder);
      logger.i('RESPONSE: $data');
    } catch (e) {
      _handleError(e);
    }
    return data;
  }

  _handleError(e) {
    if (e is BackendlessException) {
      logger.e("URL: ${e.uri}/n${e.code} - Error ${e.message}");
    } else if (e is PlatformException) {
      logger.e("${e.code} - Error ${e.message}");
    } else {
      logger.e("ERROR: $e");
    }
  }
}
