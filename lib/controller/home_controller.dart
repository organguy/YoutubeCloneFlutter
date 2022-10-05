
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/models/youtube_video_result_model.dart';
import 'package:youtube_clone/repository/youtube_repository.dart';

class HomeController extends GetxController{

  static HomeController get to => Get.find();

  Rx<YoutubeVideoResultModel> youtubeResult = YoutubeVideoResultModel(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event(){
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPageToken != ""){
        _videoLoad();
      }
    });
  }

  void _videoLoad() async{
    YoutubeVideoResultModel youtubeVideoResultModel =
                        await YoutubeRepository.to.loadVideos(youtubeResult.value.nextPageToken ?? '');

    if(youtubeVideoResultModel.items!.isNotEmpty){
      youtubeResult.update((youtube) {
        youtube!.nextPageToken = youtubeVideoResultModel.nextPageToken;
        youtube.items!.addAll(youtubeVideoResultModel.items!);
      });
    }
  }
}