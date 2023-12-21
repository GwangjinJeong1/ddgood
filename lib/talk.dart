import 'package:ddgood/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'convert.dart';
import 'drawer/calendar.dart';
import 'drawer/drawer.dart';
import 'drawer/wordcloud.dart';
import 'main.dart';

class TalkPage extends StatefulWidget {
  const TalkPage({
    super.key,
  });

  @override
  State<TalkPage> createState() => _TalkPageState();
}

class _TalkPageState extends State<TalkPage> {
  bool isPaused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              iconSize: 25,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.black87,
        title: const Text(
          '서비스명',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 84),
            Text(
              '듣고 있어요!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 118),
            LottieBuilder.asset(
              'assets/images/talk.json',
              animate: true, // 애니메이션을 재생하도록 설정
              repeat: isPaused ? false : true, // 애니메이션을 반복하도록 설정 (선택 사항)
              frameRate: FrameRate.max, // 최대 프레임 속도로 설정 (선택 사항)
              onLoaded: (composition) {
                // 로티 컴포지션 로딩 후 실행할 동작 설정 (선택 사항)
              },
            ),
            const SizedBox(height: 125.46),
            SizedBox(
              width: 275,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isPaused == false)
                      isPaused = true;
                    else if (isPaused == true) isPaused = false;
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: const Color.fromRGBO(246, 222, 131, 1)),
                child: const Text(
                  '일시중지',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 11),
            SizedBox(
              width: 275,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConvertPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Colors.black),
                child: const Text(
                  '완료',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
