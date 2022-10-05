import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/binding/init_binding.dart';
import 'package:youtube_clone/controller/youtube_detail_controller.dart';
import 'package:youtube_clone/ui/app.dart';
import 'package:youtube_clone/ui/search.dart';
import 'package:youtube_clone/ui/youtube_detail.dart';

import 'controller/youtube_search_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Youtube Clone App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(
            name: '/detail/:videoId',
            page: () => const YoutubeDetail(),
            binding: BindingsBuilder(() => Get.lazyPut<YoutubeDetailController>(() => YoutubeDetailController())),
        ),
        GetPage(
          name: '/search',
          page: () => const YoutubeSearch(),
          binding: BindingsBuilder(() => Get.lazyPut<YoutubeSearchController>(() => YoutubeSearchController())),
        ),
      ],
    );
  }
}
