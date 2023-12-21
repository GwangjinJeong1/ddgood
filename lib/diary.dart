import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'drawer/calendar.dart';
import 'convert.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({
    super.key,
  });

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diary Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  const Text(
                    '23/12/24',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      // 아이콘을 눌렀을 때 이동할 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()),
                      );
                    },
                    child: Container(
                      width: 48.0, // 원하는 크기로 조절
                      height: 48.0, // 원하는 크기로 조절
                      child: const Center(
                        child: Icon(
                          Icons.calendar_today, // 달력 모양의 아이콘
                          color: Color.fromRGBO(95, 94, 93, 1), // 아이콘 색상 설정
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 22, left: 17, right: 17),
                height: 344,
                width: 343,
                color: const Color.fromRGBO(217, 217, 217, 1), // 연두색 설정
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '# 오늘의 키워드 # 오늘의 키워드',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 116,
                    ),
                    Center(
                      child: Text(
                        '음성파일 텍스트 변환',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              const Center(
                child: Text(
                  '12/24 일기 듣기',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              const SizedBox(height: 22),
              Image.asset("assets/images/player.png"),
              const SizedBox(height: 27),
              Center(
                child: SizedBox(
                  width: 131,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ConvertPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0)),
                        backgroundColor:
                            const Color.fromRGBO(217, 217, 217, 1)),
                    child: const Text(
                      '완료',
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
