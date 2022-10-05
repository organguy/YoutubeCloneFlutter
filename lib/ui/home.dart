import 'package:flutter/material.dart';
import 'package:youtube_clone/components/video_widget.dart';
import 'package:youtube_clone/components/youtube_appbar.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/controller/home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx( () =>
          CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            const SliverAppBar(
              title: YoutubeAppBar(),
              backgroundColor: Colors.white,
              floating: true,
              snap: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index){
               return GestureDetector(
                 onTap: (){
                   Get.toNamed('/detail/${controller.youtubeResult.value.items![index].id.videoId}');
                 },
                 child: VideoWidget(video: controller.youtubeResult.value.items![index]),
               );
              },
              childCount: controller.youtubeResult.value.items == null
                                ? 0 : controller.youtubeResult.value.items!.length,
              )
            )
          ],
        ),
      ),
    );
  }
}
