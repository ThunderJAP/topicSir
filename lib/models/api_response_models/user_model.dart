class UserModel {
  UserModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final Data? data;

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
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
  Data({
    required this.accountType,
    required this.subscribed,
    required this.subscription,
    required this.isComplete,
    required this.name,
    required this.accessToken,
  });

  final int? accountType;
  final bool? subscribed;
  final DateTime? subscription;
  final IsComplete? isComplete;
  final bool? name;
  final String? accessToken;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      accountType: json["accountType"],
      subscribed: json["subscribed"],
      subscription: DateTime.tryParse(json["subscription"] ?? ""),
      isComplete: json["isComplete"] == null ? null : IsComplete.fromJson(json["isComplete"]),
      name: json["name"],
      accessToken: json["accessToken"],
    );
  }

  Map<String, dynamic> toJson() => {
    "accountType": accountType,
    "subscribed": subscribed,
    "subscription": subscription?.toIso8601String(),
    "isComplete": isComplete?.toJson(),
    "name": name,
    "accessToken": accessToken,
  };

}

class IsComplete {
  IsComplete({
    required this.base,
    required this.full,
  });

  final bool? base;
  final bool? full;

  factory IsComplete.fromJson(Map<String, dynamic> json){
    return IsComplete(
      base: json["base"],
      full: json["full"],
    );
  }

  Map<String, dynamic> toJson() => {
    "base": base,
    "full": full,
  };

}
