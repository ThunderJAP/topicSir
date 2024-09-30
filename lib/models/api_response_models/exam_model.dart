class ExamModel {
  ExamModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final ExamData? data;

  factory ExamModel.fromJson(Map<String, dynamic> json){
    return ExamModel(
      success: json["success"],
      data: json["data"] == null ? null : ExamData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };

}

class ExamData {
  ExamData({
    required this.count,
    required this.next,
    required this.result,
  });

  final int? count;
  final bool? next;
  final List<Result> result;

  factory ExamData.fromJson(Map<String, dynamic> json){
    return ExamData(
      count: json["count"],
      next: json["next"],
      result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "result": result.map((x) => x.toJson()).toList(),
  };

}

class Result {
  Result({
    required this.id,
    required this.title,
    required this.visibility,
    required this.category,
    required this.description,
    required this.information,
    required this.questionCount,
    required this.maxScore,
    required this.duration,
    required this.createdAt,
  });

  final String? id;
  final String? title;
  final int? visibility;
  final String? category;
  final String? description;
  final String? information;
  final int? questionCount;
  final int? maxScore;
  final int? duration;
  final DateTime? createdAt;

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      id: json["_id"],
      title: json["title"],
      visibility: json["visibility"],
      category: json["category"],
      description: json["description"],
      information: json["information"],
      questionCount: json["question_count"],
      maxScore: json["max_score"],
      duration: json["duration"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "visibility": visibility,
    "category": category,
    "description": description,
    "information": information,
    "question_count": questionCount,
    "max_score": maxScore,
    "duration": duration,
    "createdAt": createdAt?.toIso8601String(),
  };

}
