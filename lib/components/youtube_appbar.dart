import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeAppBar extends StatelessWidget {
  const YoutubeAppBar({Key? key}) : super(key: key);

  Widget _logo(){
    return Image.asset('assets/images/logo.png', width: 130,);
  }

  Widget _actions(){
    return Row(
      children: [
        GestureDetector(
          onTap: (){},
          child: SizedBox(
            width: 23,
            height: 23,
            child: SvgPicture.asset('assets/svg/icons/bell.svg'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GestureDetector(
            onTap: (){
              Get.toNamed('/search');
            },
            child: SizedBox(
              width: 30,
              height: 30,
              child: SvgPicture.asset('assets/svg/icons/search.svg'),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.grey.withOpacity(0.5),
          backgroundImage: Image.network('https://yt3.ggpht.com/CRfIeldfkRMlZQDIFjl9JOiO0vfbaoAcozOXhxOWSupfmajfSMBBEcs3_2axkGeaiToUt-Ry=s88-c-k-c0x00ffffff-no-rj').image,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _actions(),
      ],
    );
  }
}
