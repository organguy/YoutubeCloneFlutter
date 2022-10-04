import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/binding/init_binding.dart';
import 'package:youtube_clone/ui/app.dart';
import 'package:youtube_clone/ui/youtube_detail.dart';

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
        GetPage(name: '/detail/:videoId', page: () => const YoutubeDetail())
      ],
    );
  }
}
