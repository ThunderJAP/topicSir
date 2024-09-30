class LeaderBoardModel {
  LeaderBoardModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final List<LeaderBoardData> data;

  factory LeaderBoardModel.fromJson(Map<String, dynamic> json){
    return LeaderBoardModel(
      success: json["success"],
      data: json["data"] == null ? [] : List<LeaderBoardData>.from(json["data"]!.map((x) => LeaderBoardData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class LeaderBoardData {
  LeaderBoardData({
    required this.owner,
    required this.score,
    required this.attempts,
    required this.exams,
  });

  final Owner? owner;
  final int? score;
  final int? attempts;
  final int? exams;

  factory LeaderBoardData.fromJson(Map<String, dynamic> json){
    return LeaderBoardData(
      owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      score: json["score"],
      attempts: json["attempts"],
      exams: json["exams"],
    );
  }

  Map<String, dynamic> toJson() => {
    "owner": owner?.toJson(),
    "score": score,
    "attempts": attempts,
    "exams": exams,
  };

}

class Owner {
  Owner({
    required this.userType,
    required this.country,
    required this.gender,
    required this.name,
    required this.phone,
    required this.city,
  });

  final int? userType;
  final String? country;
  final String? gender;
  final Name? name;
  final Phone? phone;
  final String? city;

  factory Owner.fromJson(Map<String, dynamic> json){
    return Owner(
      userType: json["userType"],
      country: json["country"],
      gender: json["gender"],
      name: json["name"] == null ? null : Name.fromJson(json["name"]),
      phone: json["phone"] == null ? null : Phone.fromJson(json["phone"]),
      city: json["city"],
    );
  }

  Map<String, dynamic> toJson() => {
    "userType": userType,
    "country": country,
    "gender": gender,
    "name": name?.toJson(),
    "phone": phone?.toJson(),
    "city": city,
  };

}

class Name {
  Name({
    required this.first,
    required this.last,
  });

  final String? first;
  final String? last;

  factory Name.fromJson(Map<String, dynamic> json){
    return Name(
      first: json["first"],
      last: json["last"],
    );
  }

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
  };

}

class Phone {
  Phone({
    required this.country,
  });

  final String? country;

  factory Phone.fromJson(Map<String, dynamic> json){
    return Phone(
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() => {
    "country": country,
  };

}
