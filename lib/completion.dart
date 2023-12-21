import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'diary.dart';

import 'drawer/calendar.dart';
import 'drawer/wordcloud.dart';
import 'home.dart';

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
                            builder: (context) => const HomePage()),
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
      body: Container(
        color: const Color.fromRGBO(250, 248, 244, 1),
        child: Center(
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
                    SizedBox(
                      width: 167,
                      height: 44,
                      child: Container(
                        width: double.infinity, // Adjust width as needed
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color.fromRGBO(232, 183, 0, 1),
                            width: 1,
                          ),
                          color: const Color.fromRGBO(255, 245, 205, 1),
                        ),
                        child: const Center(
                          child: Text(
                            '# 일어나',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(232, 183, 0, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 167,
                      height: 44,
                      child: Container(
                        width: double.infinity, // Adjust width as needed
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color.fromRGBO(232, 183, 0, 1),
                            width: 1,
                          ),
                          color: const Color.fromRGBO(255, 245, 205, 1),
                        ),
                        child: const Center(
                          child: Text(
                            '# 추워',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(232, 183, 0, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
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
      ),
    );
  }
}
