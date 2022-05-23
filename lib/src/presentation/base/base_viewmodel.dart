import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../presentation.dart';

abstract class BaseViewModel extends ChangeNotifier {
  BuildContext? _context;

  BuildContext get context => _context!;

  setContext(BuildContext value) {
    _context = value;
  }

  final loadingSubject = BehaviorSubject<bool>.seeded(false);
  final errorSubject = BehaviorSubject<String>();

  void setLoading(bool loading) {
    if (loading != isLoading) loadingSubject.add(loading);
  }

  bool get isLoading => loadingSubject.value;

  void setError(String message) {
    errorSubject.add(message);
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void dispose() async {
    await loadingSubject.drain();
    loadingSubject.close();
    await errorSubject.drain();
    errorSubject.close();
    super.dispose();
  }

  void unFocus() {
    FocusScope.of(context).unfocus();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  Future<dynamic> bottomSheet(Widget child, {Color? barrierColor}) async {
    return await showMaterialModalBottomSheet(
      context: context,
      builder: (context) => child,
      backgroundColor: Colors.transparent,
      barrierColor: barrierColor ?? Colors.black54,
    );
  }

  Future<bool?> confirm(String title) async {
    return await Get.dialog(WidgetDialogConfirm(title: title));
  }

  Future<bool?> notification(String title) async {
    return await Get.dialog(WidgetDialogNotification(title: title));
  }
}
