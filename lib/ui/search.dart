import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/controller/youtube_search_controller.dart';

import '../components/video_widget.dart';

class YoutubeSearch extends GetView<YoutubeSearchController> {
  const YoutubeSearch({Key? key}) : super(key: key);

  Widget _searchHistory() {
    return ListView(
        children: List.generate(controller.history.length, (index) =>
            ListTile(
              onTap: (){
                controller.submitSearch(controller.history[index]);
              },
              leading: SvgPicture.asset(
                'assets/svg/icons/wall-clock.svg', width: 20,),
              title: Text(controller.history[index]),
              trailing: const Icon(Icons.arrow_forward_ios, size: 15,),
            )
        )
    );
  }

  Widget _searchResultView(){
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Column(
        children: List.generate(controller.youtubeVideoResult.value.items!.length, (index) =>
          GestureDetector(
              onTap: (){
                Get.toNamed('/detail/${controller.youtubeVideoResult.value.items![index].id.videoId}');
              },
              child: VideoWidget(video: controller.youtubeVideoResult.value.items![index]),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: Get.back,
            icon: SvgPicture.asset('assets/svg/icons/back.svg')
        ),
        title: TextField(
          decoration: InputDecoration(
            fillColor: Colors.grey.withOpacity(0.2),
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onSubmitted: (value) {
            controller.submitSearch(value);
          },
        ),
      ),
      body: Obx(() {
        if(controller.youtubeVideoResult.value.items!.isNotEmpty){
          return _searchResultView();
        }else{
          return _searchHistory();
        }
      }),
    );
  }
}
