import 'dart:convert';

StatisticsModel statisticsModelFromJson(String str) => StatisticsModel.fromJson(json.decode(str));

String statisticsModelToJson(StatisticsModel data) => json.encode(data.toJson());

class StatisticsModel {
  StatisticsModel({
    this.viewCount,
    this.likeCount,
    this.favoriteCount,
    this.commentCount,
  });

  String? viewCount;
  String? likeCount;
  String? favoriteCount;
  String? commentCount;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) => StatisticsModel(
    viewCount: json["viewCount"],
    likeCount: json["likeCount"],
    favoriteCount: json["favoriteCount"],
    commentCount: json["commentCount"],
  );

  Map<String, dynamic> toJson() => {
    "viewCount": viewCount,
    "likeCount": likeCount,
    "favoriteCount": favoriteCount,
    "commentCount": commentCount,
  };
}
