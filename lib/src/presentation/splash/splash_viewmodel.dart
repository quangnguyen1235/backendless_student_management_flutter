import 'dart:async';

import 'package:get/get.dart';

import '../../resource/resource.dart';
import '../presentation.dart';

class SplashViewModel extends BaseViewModel {

  init() async {
    AppDatabase().find('HS_LOP');
  }

}
