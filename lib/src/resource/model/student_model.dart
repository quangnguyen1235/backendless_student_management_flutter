import 'package:flutter_app/src/resource/model/model.dart';

/// identificationNumber : "195658998"
/// placeOfBirth : "Thừa Thiên Huế"
/// identificationPlace : "Thừa Thiên Huế"
/// gender : true
/// trainingSystem : "Đại Học"
/// studentCode : "19T2356650"
/// isUnion : false
/// birthDay : 1653218346000
/// fatherJob : null
/// address : "19 Võ Duy Ninh"
/// motherName : "Nguyễn Thị B Mẹ"
/// motherJob : null
/// identificationDate : 1653218344000
/// fatherName : "Nguyễn Thị B Bố"
/// yearAttend : 2019
/// name : "Nguyễn Thị B"

class StudentModel {

  /// Các thuộc tính của sinh viên.
  String? identificationNumber;
  String? placeOfBirth;
  String? identificationPlace;
  bool? gender;
  String? trainingSystem;
  String? studentCode;
  bool? isUnion;
  DateTime? birthDay;
  dynamic fatherJob;
  String? address;
  String? motherName;
  dynamic motherJob;
  DateTime? identificationDate;
  String? fatherName;
  int? yearAttend;
  String? name;
  NationModel? nation;
  SubModel? subject;
  ClassModel? classSubject;
  MajorModel? major;
  ProvinceModel? province;
  DateTime? unionDate;
  String? unionPlace;

  StudentModel({
    this.identificationNumber,
    this.placeOfBirth,
    this.identificationPlace,
    this.gender,
    this.trainingSystem,
    this.studentCode,
    this.isUnion,
    this.birthDay,
    this.fatherJob,
    this.address,
    this.motherName,
    this.motherJob,
    this.identificationDate,
    this.fatherName,
    this.yearAttend,
    this.name,
    this.nation,
    this.subject,
    this.classSubject,
    this.major,
    this.province,
    this.unionDate,
    this.unionPlace,
  });

  /// Hàm khỏi tạo fromJson để convert đối tượng từ jsonObject
  ///
  /// Ví dụ: StudentModel student = StudentModel.fromJson(json);
  StudentModel.fromJson(dynamic json) {
    identificationNumber = json['SoCMND'];
    placeOfBirth = json['NoiSinh'];
    identificationPlace = json['NoiCap'];
    gender = json['GioiTinh'];
    trainingSystem = json['HeDaoTao'];
    studentCode = json['MaSV'];
    isUnion = json['DoanVien'];
    birthDay = json['NgaySinh'];
    fatherJob = json['NgheBo'];
    address = json['DiaChi'];
    motherName = json['HoTenMe'];
    motherJob = json['NgheMe'];
    identificationDate = json['NgayCap'];
    fatherName = json['HoTenBo'];
    yearAttend = json['NamTuyenSinh'];
    name = json['HoTen'];
    nation = json['MaDanToc'] != null ? NationModel.fromJson(json['MaDanToc']) : null;
    subject = json['MaDoiTuong'] != null ? SubModel.fromJson(json['MaDoiTuong']) : null;
    classSubject = json['MaLop'] != null ? ClassModel.fromJson(json['MaLop']) : null;
    major = json['MaNganh'] != null ? MajorModel.fromJson(json['MaNganh']) : null;
    province = json['MaTinh'] != null ? ProvinceModel.fromJson(json['MaTinh']) : null;
    unionPlace = json['NoiKetNap'];
    unionDate = json['NgayVD'];
  }

  /// Clone ra một đối tượng khác với những thuộc tính được thay đổi so với đối tượng ban đầu
  ///
  /// Ví dụ:
  ///   StudentModel a = StudentModel(name: "Quang", studentCode: 1);
  ///   StudentModel b = a.copyWith(name: "Trung");
  ///
  ///   a.name => Quang
  ///   a.studentCode => 1
  ///
  ///   b.name => Trung
  ///   b.studentCode => 1
  StudentModel copyWith({
    String? identificationNumber,
    String? placeOfBirth,
    String? identificationPlace,
    bool? gender,
    String? trainingSystem,
    String? studentCode,
    bool? isUnion,
    DateTime? birthDay,
    dynamic fatherJob,
    String? address,
    String? motherName,
    dynamic motherJob,
    DateTime? identificationDate,
    String? fatherName,
    int? yearAttend,
    String? name,
    NationModel? nation,
    SubModel? subject,
    ClassModel? classSubject,
    MajorModel? major,
    ProvinceModel? province,
    DateTime? unionDate,
    String? unionPlace,
  }) =>
      StudentModel(
        identificationNumber: identificationNumber ?? this.identificationNumber,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        identificationPlace: identificationPlace ?? this.identificationPlace,
        gender: gender ?? this.gender,
        trainingSystem: trainingSystem ?? this.trainingSystem,
        studentCode: studentCode ?? this.studentCode,
        isUnion: isUnion ?? this.isUnion,
        birthDay: birthDay ?? this.birthDay,
        fatherJob: fatherJob ?? this.fatherJob,
        address: address ?? this.address,
        motherName: motherName ?? this.motherName,
        motherJob: motherJob ?? this.motherJob,
        identificationDate: identificationDate ?? this.identificationDate,
        fatherName: fatherName ?? this.fatherName,
        yearAttend: yearAttend ?? this.yearAttend,
        name: name ?? this.name,
        nation: nation ?? this.nation,
        subject: subject ?? this.subject,
        classSubject: classSubject ?? this.classSubject,
        major: major ?? this.major,
        province: province ?? this.province,
        unionDate: unionDate ?? this.unionDate,
        unionPlace: unionPlace ?? this.unionPlace,
      );

  /// Convert đối tượng sang dạng json
  ///
  /// Ví dụ:
  ///   StudentModel a = StudentModel(name: "Quang", studentCode: 1);
  ///
  ///   a.toJson => {
  ///     'MaSV' : 1,
  ///     'HoTen' : "Quang"
  ///   }
  ///
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['SoCMND'] = identificationNumber;
    map['NoiSinh'] = placeOfBirth;
    map['NoiCap'] = identificationPlace;
    map['GioiTinh'] = gender;
    map['HeDaoTao'] = trainingSystem;
    map['MaSV'] = studentCode;
    map['DoanVien'] = isUnion;
    map['NgaySinh'] = birthDay;
    map['NgheBo'] = fatherJob;
    map['DiaChi'] = address;
    map['HoTenMe'] = motherName;
    map['NgheMe'] = motherJob;
    map['NgayCap'] = identificationDate;
    map['HoTenBo'] = fatherName;
    map['NamTuyenSinh'] = yearAttend;
    map['HoTen'] = name;
    map['MaDanToc'] = nation?.toJson();
    map['MaDoiTuong'] = subject?.toJson();
    map['MaLop'] = classSubject?.toJson();
    map['MaNganh'] = major?.toJson();
    map['MaTinh'] = province?.toJson();
    map['NoiKetNap'] = unionPlace;
    map['NgayVD'] = unionDate;
    return map;
  }
}
