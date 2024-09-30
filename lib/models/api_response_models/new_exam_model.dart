class NewExamModel {
  NewExamModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final AttemptData? data;

  factory NewExamModel.fromJson(Map<String, dynamic> json){
    return NewExamModel(
      success: json["success"],
      data: json["data"] == null ? null : AttemptData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };

}

class AttemptData {
  AttemptData({
    required this.attemptId,
  });

  final String? attemptId;

  factory AttemptData.fromJson(Map<String, dynamic> json){
    return AttemptData(
      attemptId: json["attempt_id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "attempt_id": attemptId,
  };

}
