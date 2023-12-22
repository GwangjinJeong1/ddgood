import 'package:flutter/material.dart';

import 'completion.dart';
import 'drawer/drawer.dart';
import 'utils/color_scheme.dart';
import 'utils/text_theme.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({
    super.key,
  });

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  // 변수 추가
  bool isTextConverted = false;

  @override
  void initState() {
    super.initState();

    // 2초 뒤에 isTextConverted를 true로 설정
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isTextConverted = true;
      });
    });
    // 4초 뒤에 isTextConverted를 true로 설정
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return CompletionPage(); // 전환할 페이지 위젯
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
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: Center(
          key: ValueKey<bool>(isTextConverted),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 118),
              Text(isTextConverted ? '변환이\n완료되었어요' : '텍스트로\n변환 중이에요',
                  textAlign: TextAlign.center,
                  style: hm21.copyWith(color: AppColor.text)),
              const SizedBox(height: 59.5),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isTextConverted = true;
                  });
                },
                child: SizedBox(
                    width: 181,
                    height: 181,
                    child: isTextConverted
                        ? Image.asset("assets/images/Check.png")
                        : Image.asset("assets/images/Text.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
