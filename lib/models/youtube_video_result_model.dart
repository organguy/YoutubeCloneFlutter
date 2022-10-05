
import 'package:youtube_clone/models/video_model.dart';

class YoutubeVideoResultModel{
  int? totalResults;
  int? resultsPerPage;
  String? nextPageToken;
  List<VideoModel>? items;


  YoutubeVideoResultModel({
    this.totalResults,
    this.resultsPerPage,
    this.nextPageToken,
    this.items
  });

  factory YoutubeVideoResultModel.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResultModel(
          totalResults: json['pageInfo']['totalResults'],
          resultsPerPage: json['pageInfo']['resultsPerPage'],
          nextPageToken: json['nextPageToken'] ?? '',
          items: List<VideoModel>.from(json['items'].map((data) => VideoModel.fromJson(data)))
      );
}