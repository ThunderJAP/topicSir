class QuestionExamModel {
  QuestionExamModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final QuestionData? data;

  factory QuestionExamModel.fromJson(Map<String, dynamic> json){
    return QuestionExamModel(
      success: json["success"],
      data: json["data"] == null ? null : QuestionData.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
  };

}

class QuestionData {
  QuestionData({
    required this.attempt,
    required this.exam,
    required this.status,
    required this.answeredCount,
    required this.createdAt,
    required this.groups,
  });

  final String? attempt;
  final String? exam;
  final String? status;
  final int? answeredCount;
  final DateTime? createdAt;
  final List<Group> groups;

  factory QuestionData.fromJson(Map<String, dynamic> json){
    return QuestionData(
      attempt: json["attempt"],
      exam: json["exam"],
      status: json["status"],
      answeredCount: json["answeredCount"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "attempt": attempt,
    "exam": exam,
    "status": status,
    "answeredCount": answeredCount,
    "createdAt": createdAt?.toIso8601String(),
    "groups": groups.map((x) => x.toJson()).toList(),
  };

}

class Group {
  Group({
    required this.id,
    required this.exam,
    required this.title,
    required this.description,
    required this.image,
    required this.audio,
    required this.questions,
  });

  final String? id;
  final String? exam;
  final String? title;
  final String? description;
  final bool? image;
  final bool? audio;
  final List<Question> questions;

  factory Group.fromJson(Map<String, dynamic> json){
    return Group(
      id: json["_id"],
      exam: json["exam"],
      title: json["title"],
      description: json["description"],
      image: json["image"],
      audio: json["audio"],
      questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "exam": exam,
    "title": title,
    "description": description,
    "image": image,
    "audio": audio,
    "questions": questions.map((x) => x.toJson()).toList(),
  };

}

class Question {
  Question({
    required this.id,
    required this.group,
    required this.number,
    required this.isExample,
    required this.linked,
    required this.title,
    required this.description,
    required this.score,
    required this.image,
    required this.audio,
    required this.answers,
  });

  final String? id;
  final String? group;
  final dynamic number;
  final bool? isExample;
  final Linked? linked;
  final String? title;
  final String? description;
  final dynamic score;
  final dynamic image;
  final dynamic audio;
  final List<Answer> answers;

  factory Question.fromJson(Map<String, dynamic> json){
    return Question(
      id: json["_id"],
      group: json["group"],
      number: json["number"],
      isExample: json["isExample"],
      linked: json["linked"] == null ? null : Linked.fromJson(json["linked"]),
      title: json["title"],
      description: json["description"],
      score: json["score"],
      image: json["image"],
      audio: json["audio"],
      answers: json["answers"] == null ? [] : List<Answer>.from(json["answers"]!.map((x) => Answer.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "group": group,
    "number": number,
    "isExample": isExample,
    "linked": linked?.toJson(),
    "title": title,
    "description": description,
    "score": score,
    "image": image,
    "audio": audio,
    "answers": answers.map((x) => x.toJson()).toList(),
  };

}

class Answer {
  Answer({
    required this.id,
    required this.description,
    required this.image,
    required this.number,
    required this.question,
    required this.isCorrect,
  });

  final String? id;
  final String? description;
  final dynamic image;
  final int? number;
  final String? question;
  final bool? isCorrect;

  factory Answer.fromJson(Map<String, dynamic> json){
    return Answer(
      id: json["_id"],
      description: json["description"],
      image: json["image"],
      number: json["number"],
      question: json["question"],
      isCorrect: json["isCorrect"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "image": image,
    "number": number,
    "question": question,
    "isCorrect": isCorrect,
  };

}

class Linked {
  Linked({
    required this.isLinked,
  });

  final bool? isLinked;

  factory Linked.fromJson(Map<String, dynamic> json){
    return Linked(
      isLinked: json["isLinked"],
    );
  }

  Map<String, dynamic> toJson() => {
    "isLinked": isLinked,
  };

}
