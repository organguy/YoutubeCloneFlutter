
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/models/channel_model.dart';
import 'package:youtube_clone/models/statistics_model.dart';
import 'package:youtube_clone/models/youtube_video_result_model.dart';

class YoutubeRepository extends GetConnect{
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = 'https://www.googleapis.com';
    super.onInit();
  }

  Future<YoutubeVideoResultModel> loadVideos(String nextPageToken) async{
    String url = '/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyA9mUp5lgGi8D0hcH1U6H2m_PO7ntwD1pc&pageToken=$nextPageToken';
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      if(response.body['items'] != null && response.body['items'].length > 0){
        return YoutubeVideoResultModel.fromJson(response.body);
      }else{
        return Future.error('result is null!!!');
      }
    }
  }

  Future<StatisticsModel> getVideoInfoById(String videoId) async{
    String url = '/youtube/v3/videos?part=statistics&key=AIzaSyA9mUp5lgGi8D0hcH1U6H2m_PO7ntwD1pc&id=$videoId';
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      if(response.body['items'] != null && response.body['items'].length > 0){
        Map<String, dynamic> data = response.body['items'][0];
        return StatisticsModel.fromJson(data['statistics']);
      }else{
        return Future.error('result is null!!!');
      }
    }
  }

  Future<ChannelModel> getChannelInfoById(String channelId) async{
    String url = '/youtube/v3/channels?part=statistics,snippet&key=AIzaSyA9mUp5lgGi8D0hcH1U6H2m_PO7ntwD1pc&id=$channelId';
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      if(response.body['items'] != null && response.body['items'].length > 0){
        return ChannelModel.fromJson(response.body['items'][0]);
      }else{
        return Future.error('result is null!!!');
      }
    }
  }

  Future<YoutubeVideoResultModel> search(String searchKey, String nextPageToken) async{
    String url = '/youtube/v3/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyA9mUp5lgGi8D0hcH1U6H2m_PO7ntwD1pc&pageToken=$nextPageToken&q=$searchKey';
    final response = await get(url);
    if(response.status.hasError){
      return Future.error(response.statusText!);
    }else{
      if(response.body['items'] != null && response.body['items'].length > 0){
        return YoutubeVideoResultModel.fromJson(response.body);
      }else{
        return Future.error('result is null!!!');
      }
    }
  }
}