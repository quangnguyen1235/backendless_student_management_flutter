/// subCode : "DT01"
/// subName : "Có công với Cách Mạng"

class SubModel {
  SubModel({
    this.subCode,
    this.subName,
  });

  SubModel.fromJson(dynamic json) {
    subCode = json['MaDoiTuong'];
    subName = json['TenDoiTuong'];
  }
  String? subCode;
  String? subName;

  SubModel copyWith({
    String? subCode,
    String? subName,
  }) =>
      SubModel(
        subCode: subCode ?? this.subCode,
        subName: subName ?? this.subName,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MaDoiTuong'] = subCode;
    map['TenDoiTuong'] = subName;
    return map;
  }
}
