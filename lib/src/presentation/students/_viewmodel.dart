import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/src/presentation/students/dialog_select_items.dart';
import 'package:flutter_app/src/resource/database/dao/dao.dart';
import 'package:flutter_app/src/resource/model/model.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class StudentsViewModel extends BaseViewModel {
  final TextEditingController majorController = TextEditingController();
  final TextEditingController classSubjController = TextEditingController();

  List<StudentModel> data = [];

  List<MajorModel> majors = [];

  List<ClassModel> classSubjects = [];

  MajorModel? selectMajor;

  ClassModel? selectClassSubject;

  init() async {
    setLoading(true);
    data = await getStudent();
    majors = await getMajor();
    classSubjects = await getClassSubject();
    setLoading(false);
    notifyListeners();
  }

  Future<List<StudentModel>> getStudent() async {
    final DataQueryBuilder dataQueryBuilder = DataQueryBuilder();
    dataQueryBuilder.related = [
      'MaNganh',
      'MaDoiTuong',
      'MaDanToc',
      'MaLop',
      'MaTinh',
    ];
    String majorClause = selectMajor != null ? "MaNganh.MaNganh = '${selectMajor!.majorCode}'" : "1=1";
    String classClause = selectClassSubject != null ? "MaLop.MaLop = '${selectClassSubject!.classCode}'" : "1=1";
    dataQueryBuilder.whereClause = "$majorClause AND $classClause";
    final _ = await StudentDao().read(queryBuilder: dataQueryBuilder);
    return _;
  }

  Future<List<MajorModel>> getMajor() async {
    return await MajorDao().read();
  }

  Future<List<ClassModel>> getClassSubject() async {
    final DataQueryBuilder dataQueryBuilder = DataQueryBuilder();
    dataQueryBuilder.related = [
      'MaNganh',
    ];
    return await ClassDao().read(queryBuilder: dataQueryBuilder);
  }

  onSelectMajor() async {
    final index = await bottomSheet(
      DialogSelectItems(
        listItem: majors.map((e) => e.majorName!).toList(),
        indexPage: selectMajor != null ? majors.indexOf(selectMajor!) : -1,
      ),
    );
    if (index != null) {
      if (index == -1) selectMajor = null;
      else{
        selectMajor = majors[index];
        if(selectMajor?.majorCode != selectClassSubject?.major?.majorCode){
          selectClassSubject = null;
        }
      }
      notifyListeners();
    }
  }

  onSelectClassSubject() async {
    final temp = classSubjects.where((e) => selectMajor?.majorCode != null ? e.major?.majorCode == selectMajor?.majorCode : true).toList();
    final index = await bottomSheet(
      DialogSelectItems(
        listItem: temp.map((e) => e.className!).toList(),
        indexPage: selectClassSubject != null ? classSubjects.indexOf(selectClassSubject!) : -1,
      ),
    );
    if (index != null) {
      if (index == -1) selectClassSubject = null;
      else selectClassSubject = temp[index];
      notifyListeners();
    }
  }

  onSubmitSearch() async {
    setLoading(true);
    data = await getStudent();
    notifyListeners();
    setLoading(false);
  }
}
