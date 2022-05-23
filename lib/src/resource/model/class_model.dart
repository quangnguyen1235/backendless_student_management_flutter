import 'package:flutter_app/src/resource/model/major_model.dart';

class ClassModel {
  ClassModel({
    this.classCode,
    this.className,
    this.major,
  });

  ClassModel.fromJson(dynamic json) {
    classCode = json['MaLop'];
    className = json['TenLop'];
    major = json['MaNganh'] != null ? MajorModel.fromJson(json['MaNganh']) : null;
  }
  String? classCode;
  String? className;
  MajorModel? major;

  ClassModel copyWith({
    String? classCode,
    String? className,
    MajorModel? major,
  }) =>
      ClassModel(
        classCode: classCode ?? this.classCode,
        className: className ?? this.className,
        major: major ?? this.major,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MaLop'] = classCode;
    map['TenLop'] = className;
    if (major != null) {
      map['MaNganh'] = major?.toJson();
    }
    return map;
  }
}

