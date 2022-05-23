class MajorModel {
  MajorModel({
    this.majorCode,
    this.majorName,
  });

  MajorModel.fromJson(dynamic json) {
    majorName = json['TenNganh'];
    majorCode = json['MaNganh'];
  }

  String? majorName;
  String? majorCode;

  MajorModel copyWith({
    String? majorName,
    String? majorCode,
  }) =>
      MajorModel(
        majorName: majorName ?? this.majorName,
        majorCode: majorCode ?? this.majorCode,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TenNganh'] = majorName;
    map['MaNganh'] = majorCode;
    return map;
  }
}
