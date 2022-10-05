
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/controller/app_controller.dart';
import 'package:youtube_clone/ui/home.dart';
import 'package:youtube_clone/ui/inventory.dart';
import 'package:youtube_clone/ui/explore.dart';
import 'package:youtube_clone/ui/subscribe.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){
        switch(RouteName.values[controller.currentIndex.value]){
          case RouteName.Home:
            return Home();
          case RouteName.Explore:
            return const Explore();
          case RouteName.Add:
            break;
          case RouteName.Subscribe:
            return const Subscribe();
          case RouteName.Inventory:
            return const Inventory();
        }
        return Container();
      }
    ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.black,
          showSelectedLabels: true,
          onTap: controller.changePageIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/home_off.svg'),
              activeIcon: SvgPicture.asset('assets/svg/icons/home_on.svg'),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/compass_off.svg', width: 22,),
              activeIcon: SvgPicture.asset('assets/svg/icons/compass_on.svg', width: 22,),
              label: '탐색',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset('assets/svg/icons/plus.svg', width: 35,),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/subs_off.svg',),
              activeIcon: SvgPicture.asset('assets/svg/icons/subs_on.svg',),
              label: '구독',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/svg/icons/library_off.svg',),
              activeIcon: SvgPicture.asset('assets/svg/icons/library_on.svg',),
              label: '보관함',
            ),
          ],
        ),
      ),
    );
  }
}
