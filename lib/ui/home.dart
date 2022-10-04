import 'package:flutter/material.dart';
import 'package:youtube_clone/components/video_widget.dart';
import 'package:youtube_clone/components/youtube_appbar.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
                 Get.toNamed('/detail/$index');
               },
               child: VideoWidget(),
             );
            },
            childCount: 10,
            )
          )
        ],
      ),
    );
  }
}
