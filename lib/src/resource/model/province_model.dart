/// provinceCode : 1
/// provinceName : "Hà Nội"

class ProvinceModel {
  ProvinceModel({
    this.provinceCode,
    this.provinceName,
  });

  ProvinceModel.fromJson(dynamic json) {
    provinceCode = json['MaTinh'];
    provinceName = json['TenTinh'];
  }

  int? provinceCode;
  String? provinceName;

  ProvinceModel copyWith({
    int? provinceCode,
    String? provinceName,
  }) =>
      ProvinceModel(
        provinceCode: provinceCode ?? this.provinceCode,
        provinceName: provinceName ?? this.provinceName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MaTinh'] = provinceCode;
    map['TenTinh'] = provinceName;
    return map;
  }
}
