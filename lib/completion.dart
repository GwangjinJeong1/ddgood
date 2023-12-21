import 'package:flutter/material.dart';

import 'components/components.dart';
import 'diary.dart';

import 'drawer/drawer.dart';
import 'home.dart';
import 'utils/color_scheme.dart';
import 'utils/text_theme.dart';

class CompletionPage extends StatefulWidget {
  const CompletionPage({
    super.key,
  });

  @override
  State<CompletionPage> createState() => _CompletionPageState();
}

class _CompletionPageState extends State<CompletionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral,
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        title: const Text('서비스명', style: hm21),
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
        child: Stack(
          children: <Widget>[
            Image.asset(
              "assets/images/Shine.png",
              width: 410,
              height: 587,
              fit: BoxFit.cover,
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 178),
                  const Text(
                    '칙칙님의 하루',
                    style: TextStyle(fontSize: 21),
                  ),
                  const SizedBox(height: 58),
                  const HashTag(content: '일어나'),
                  const SizedBox(height: 10),
                  const HashTag(content: '추워'),
                  const SizedBox(height: 141),
                  SizedBox(
                    width: 275,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DiaryPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor:
                            const Color.fromRGBO(246, 222, 131, 1),
                      ),
                      child: const Text(
                        '일기 확인하기',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
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
                          MaterialPageRoute(
                              builder: (context) => const HomePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      child: const Text(
                        '일기 쓰러가기',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
