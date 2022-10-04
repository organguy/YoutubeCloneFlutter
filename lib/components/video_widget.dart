import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key}) : super(key: key);

  Widget _thumbnail(){
    return Container(
      height: 250,
      color: Colors.grey.withOpacity(0.5),
    );
  }

  Widget _simpleDetailInfo(){
    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 15),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.withOpacity(0.5),
            backgroundImage: Image.network('https://yt3.ggpht.com/CRfIeldfkRMlZQDIFjl9JOiO0vfbaoAcozOXhxOWSupfmajfSMBBEcs3_2axkGeaiToUt-Ry=s88-c-k-c0x00ffffff-no-rj').image,
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Text(
                        '개남 유튜브 다시 보기 개남 유튜브 다시 보기 개남 유튜브 다시 보기 개남 유튜브 다시 보기 개남 유튜브 다시 보기 개남 유튜브 다시 보기',
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      alignment: Alignment.topCenter,
                      onPressed: (){},
                      icon: const Icon(Icons.more_vert, size: 18,)
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '개발하는 남자',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.8)
                      ),
                    ),
                    const Text(' · '),
                    Text(
                      '조회수 1000회',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6)
                      ),
                    ),
                    const Text(' · '),
                    Text(
                      '2021-02-13',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.6)
                      ),
                    )
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
