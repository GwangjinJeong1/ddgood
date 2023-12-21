import 'package:ddgood/drawer/calendar.dart';
import 'package:ddgood/drawer/wordcloud.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'talk.dart';

void main() async {
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
        title: const Text('서비스명'),
        automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        width: 243,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 50),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Spacer(), Icon(Icons.close)],
              ),
              const SizedBox(height: 13),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Color.fromRGBO(149, 149, 149, 1),
                  ),
                  SizedBox(width: 21),
                  Text(
                    '사용자',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Spacer(),
                  Icon(Icons.edit_outlined)
                ],
              ),
              const SizedBox(height: 26),
              const Divider(
                thickness: 0.4,
                color: Color.fromRGBO(149, 149, 149, 1),
              ),
              Row(
                children: [
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                    },
                    child: const Text(
                      '홈',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.4,
                color: Color.fromRGBO(149, 149, 149, 1),
              ),
              Row(
                children: [
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WordCloudPage()),
                      );
                    },
                    child: const Text(
                      '워드 클라우드',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.4,
                color: Color.fromRGBO(149, 149, 149, 1),
              ),
              Row(
                children: [
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendarPage()),
                      );
                    },
                    child: const Text('일기 기록',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                  ),
                ],
              ),
              const Divider(
                thickness: 0.4,
                color: Color.fromRGBO(149, 149, 149, 1),
              ),
              const Spacer(),
              const Row(
                children: [
                  SizedBox(width: 9),
                  Text(
                    '설정',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Row(
                children: [
                  SizedBox(width: 9),
                  Text(
                    '로그아웃',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '오늘 하루는 어땠나요?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
                width: 207,
                height: 207,
                child: Image.asset("assets/images/home_image.png")),
            SizedBox(
              width: 275,
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
                        borderRadius: BorderRadius.circular(0)),
                    backgroundColor: const Color.fromRGBO(217, 217, 217, 1)),
                child: const Text(
                  '대화 시작하기',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
