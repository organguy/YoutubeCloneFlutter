import 'package:get/get.dart';
import 'package:youtube_clone/models/channel_model.dart';
import 'package:youtube_clone/models/statistics_model.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:youtube_clone/repository/youtube_repository.dart';

class VideoController extends GetxController{

  VideoModel video;
  VideoController({required this.video});
  Rx<StatisticsModel> statistics = StatisticsModel().obs;
  Rx<ChannelModel> channelInfo = ChannelModel ().obs;

  @override
  void onInit() async{
    StatisticsModel loadStatistics = await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    ChannelModel channelModel = await YoutubeRepository.to.getChannelInfoById(video.snippet.channelId);
    channelInfo(channelModel);
    super.onInit();
  }

  String get viewCountString => '조회수 ${statistics.value.viewCount ?? '-'}회';

  String get channelImageUrl =>
      channelInfo.value.snippet != null ?
      channelInfo.value.snippet!.thumbnails.medium.url
          : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png';
}