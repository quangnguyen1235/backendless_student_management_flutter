/// MaDanToc : "KI"
/// created : 1653216271000
/// TenDanToc : "Kinh"
/// ___class : "HS_DANTOC"
/// ownerId : null
/// updated : 1653216288000
/// objectId : "0FA989F6-C0EC-45B3-B83D-D3B470F6E40A"

class NationModel {
  NationModel({
    this.nationCode,
    this.nationName,
  });

  NationModel.fromJson(dynamic json) {
    nationCode = json['MaDanToc'];
    nationName = json['TenDanToc'];
  }
  String? nationCode;
  String? nationName;

  NationModel copyWith({
    String? nationCode,
    String? nationName,
    String? objectId,
  }) =>
      NationModel(
        nationCode: nationCode ?? this.nationCode,
        nationName: nationName ?? this.nationName,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['MaDanToc'] = nationCode;
    map['TenDanToc'] = nationName;
    return map;
  }
}
