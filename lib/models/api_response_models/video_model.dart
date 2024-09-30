class VideoModel {
  VideoModel({
    required this.success,
    required this.data,
  });

  final bool? success;
  final List<VideoData> data;

  factory VideoModel.fromJson(Map<String, dynamic> json){
    return VideoModel(
      success: json["success"],
      data: json["data"] == null ? [] : List<VideoData>.from(json["data"]!.map((x) => VideoData.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data.map((x) => x.toJson()).toList(),
  };

}

class VideoData {
  VideoData({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.views,
  });

  final String? id;
  final String? title;
  final String? thumbnail;
  final String? url;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? views;

  factory VideoData.fromJson(Map<String, dynamic> json){
    return VideoData(
      id: json["_id"],
      title: json["title"],
      thumbnail: json["thumbnail"],
      url: json["url"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      views: json["views"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "thumbnail": thumbnail,
    "url": url,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "views": views,
  };

}
