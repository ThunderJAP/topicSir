class BaseModel {
  BaseModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory BaseModel.fromJson(Map<String, dynamic> json){
    return BaseModel(
      success: json["success"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };

}

class Data {
  Data({required this.json});
  final List<dynamic> json;

  factory Data.fromJson(List<dynamic> json){
    return Data(
        json: json
    );
  }

  Map<String, dynamic> toJson() => {
  };

}
