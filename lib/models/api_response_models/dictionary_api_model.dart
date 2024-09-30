class DictionaryModel {
  DictionaryModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final List<DictionaryData> data;

  factory DictionaryModel.fromJson(Map<String, dynamic> json){
    return DictionaryModel(
      success: json["success"],
      data: json["data"] == null ? [] : List<DictionaryData>.from(json["data"]!.map((x) => DictionaryData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class DictionaryData {
  DictionaryData({
    required this.id,
    required this.kr,
    required this.en,
    required this.v,
  });

  final String? id;
  final String? kr;
  final String? en;
  final int? v;

  factory DictionaryData.fromJson(Map<String, dynamic> json){
    return DictionaryData(
      id: json["_id"],
      kr: json["kr"],
      en: json["en"],
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "kr": kr,
    "en": en,
    "__v": v,
  };

}
