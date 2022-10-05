
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/controller/video_controller.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetailController extends GetxController {

  late VideoController videoController;
  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    videoController = Get.find(tag: Get.parameters['videoId']);
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: Get.parameters['videoId']!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    super.onInit();
  }

  String get title => videoController.video.snippet.title;

  String get description => videoController.video.snippet.description;

  String get viewCount => videoController.viewCountString;

  String get likeCount => videoController.statistics.value.likeCount.toString();

  String get subscriberCount => '구독자 ${videoController.channelInfo.value.statistics!.subscriberCount}';

  String get channelThumbnail => videoController.channelImageUrl;

  String get channelTitle => videoController.channelInfo.value.snippet!.title;

  String get publishedTime => DateFormat('yyyy-MM-dd').format(videoController.video.snippet.publishTime);
}