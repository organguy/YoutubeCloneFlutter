
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_clone/models/youtube_video_result_model.dart';
import 'package:youtube_clone/repository/youtube_repository.dart';

class YoutubeSearchController extends GetxController{

  String key = "SearchKey";
  RxList<String> history = RxList<String>.empty(growable: true);
  late SharedPreferences prefs;
  Rx<YoutubeVideoResultModel> youtubeVideoResult = YoutubeVideoResultModel(items: []).obs;
  late String _currentKeyword;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() async{
    _event();
    prefs = await SharedPreferences.getInstance();
    List<dynamic> initData = prefs.getStringList(key) ?? [];
    history(initData.map((_) => _.toString()).toList());
    super.onInit();
  }

  void _event(){
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent &&
          youtubeVideoResult.value.nextPageToken != ""){
        _searchYoutube(_currentKeyword);
      }
    });
  }

  void submitSearch(String searchKey){
    if(!history.contains(searchKey)){
      history.add(searchKey);
      prefs.setStringList(key, history);
    }
    _currentKeyword = searchKey;
    _searchYoutube(searchKey);
  }

  void _searchYoutube(String searchKey) async{
    String nextPageToken = youtubeVideoResult.value.nextPageToken ?? '';
    YoutubeVideoResultModel youtubeVideoResultModel = await YoutubeRepository.to.search(searchKey, nextPageToken);

    if(youtubeVideoResultModel.items!.isNotEmpty){
      youtubeVideoResult.update((youtube) {
        youtube!.nextPageToken = youtubeVideoResultModel.nextPageToken;
        youtube.items!.addAll(youtubeVideoResultModel.items!);
      });
    }
  }
}