import 'package:ddgood/utils/color_scheme.dart';
import 'package:ddgood/utils/text_theme.dart';
import 'package:flutter/material.dart';

import 'drawer/drawer.dart';
import 'talk.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.neutral,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu, color: AppColor.neutral),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: AppColor.secondary,
        title: Text('일기쓰기', style: hm21.copyWith(color: AppColor.neutral)),
        automaticallyImplyLeading: false,
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 84),
            Text('오늘 하루는 어땠나요?', style: hs21.copyWith(color: AppColor.text)),
            const SizedBox(height: 74.5),
            SizedBox(
                width: 313,
                height: 313,
                child: Image.asset("assets/images/Chicks.png")),
            const SizedBox(height: 74.5),
            SizedBox(
              width: size.width - 50,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TalkPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: AppColor.secondary),
                child: Text('일기 쓰러가기',
                    style: bs17.copyWith(color: AppColor.neutral)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
