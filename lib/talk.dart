import 'package:ddgood/utils/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'convert.dart';
import 'drawer/drawer.dart';
import 'utils/text_theme.dart';

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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.neutral,
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        title: const Text('일기쓰기', style: hm21),
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: AppColor.neutral),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
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
              animate: true,
              repeat: isPaused ? false : true,
              frameRate: FrameRate.max,
            ),
            const SizedBox(height: 125.46),
            SizedBox(
              width: size.width - 50,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isPaused == false) {
                      isPaused = true;
                    } else if (isPaused == true) {
                      isPaused = false;
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    backgroundColor:
                        isPaused ? AppColor.primary : AppColor.button),
                child: Text(isPaused ? '일기 이어쓰기' : '일시중지', style: bs17),
              ),
            ),
            const SizedBox(height: 11),
            SizedBox(
              width: size.width - 50,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return ConvertPage(); // 전환할 페이지 위젯
                      },
                      transitionsBuilder: (
                        BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child,
                      ) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: AppColor.secondary),
                child:
                    Text('완료', style: bs17.copyWith(color: AppColor.neutral)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
