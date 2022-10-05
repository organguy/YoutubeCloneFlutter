import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/components/youtube_bottom_sheet.dart';

enum RouteName{
  Home, Explore, Add, Subscribe, Inventory
}

class AppController extends GetxService{
  static AppController get to => Get.find();
  RxInt currentIndex = 0.obs;

  void changePageIndex(int index){
    if(RouteName.values[index] == RouteName.Add){
      _showBottomSheet();
    }else{
      currentIndex(index);
    }
  }

  void _showBottomSheet(){
    Get.bottomSheet(const YoutubeBottomSheet());
  }
}