class GrammarModel {
  GrammarModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final List<GrammarData> data;

  factory GrammarModel.fromJson(Map<String, dynamic> json){
    return GrammarModel(
      success: json["success"],
      data: json["data"] == null ? [] : List<GrammarData>.from(json["data"]!.map((x) => GrammarData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class GrammarData {
  GrammarData({
    required this.id,
    required this.topic,
    required this.desc,
    required this.content,
    required this.example,
  });

  final String? id;
  final String? topic;
  final String? desc;
  final String? content;
  final List<Example> example;

  factory GrammarData.fromJson(Map<String, dynamic> json){
    return GrammarData(
      id: json["_id"],
      topic: json["topic"],
      desc: json["desc"],
      content: json["content"],
      example: json["example"] == null ? [] : List<Example>.from(json["example"]!.map((x) => Example.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "topic": topic,
    "desc": desc,
    "content": content,
    "example": example.map((x) => x.toJson()).toList(),
  };

}

class Example {
  Example({
    required this.a,
    required this.b,
  });

  final String? a;
  final String? b;

  factory Example.fromJson(Map<String, dynamic> json){
    return Example(
      a: json["a"],
      b: json["b"],
    );
  }

  Map<String, dynamic> toJson() => {
    "a": a,
    "b": b,
  };

}
