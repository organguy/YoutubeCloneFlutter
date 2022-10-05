import 'package:flutter/material.dart';
import 'package:youtube_clone/controller/video_controller.dart';
import 'package:youtube_clone/models/video_model.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VideoWidget extends StatefulWidget {
  final VideoModel video;

  const VideoWidget({Key? key, required this.video}) : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {

  late VideoController videoController;

  @override
  void initState() {
    videoController = Get.put(
        VideoController(video: widget.video), tag: widget.video.id.videoId);
    super.initState();
  }


  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            imageUrl: widget.video.snippet.thumbnails.medium.url,
            placeholder: (context, url) => Container(
              height: 230,
              child: const Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  Widget _simpleDetailInfo() {
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 15),
      child: Row(
        children: [
          Obx(() {
            return CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage: Image.network(videoController.channelImageUrl).image,
            );
          }),
          const SizedBox(width: 15,),
          Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.video.snippet.title,
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                          alignment: Alignment.topCenter,
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert, size: 18,)
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3.0),
                        child: Text(
                          widget.video.snippet.channelTitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                      const Text(' · '),
                      Obx(() =>
                          Text(
                            videoController.viewCountString,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black.withOpacity(0.6)
                            ),
                          ),
                      ),
                      const Text(' · '),
                      Text(
                        DateFormat('yyyy-MM-dd').format(
                            widget.video.snippet.publishTime),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black.withOpacity(0.6)
                        ),
                      ),
                      const SizedBox(width: 10,),
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _thumbnail(),
        _simpleDetailInfo(),
      ],
    );
  }
}
