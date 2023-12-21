import 'package:flutter/material.dart';

import 'drawer/calendar.dart';
import 'convert.dart';
import 'drawer/drawer.dart';
import 'edit.dart';
import 'utils/color_scheme.dart';
import 'utils/text_theme.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 44),
              const Text(
                '2023',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              Row(
                children: [
                  const Text(
                    '12월 24일',
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
                        MaterialPageRoute(
                            builder: (context) => const CalendarPage()),
                      );
                    },
                    child: const SizedBox(
                      width: 48.0, // 원하는 크기로 조절
                      height: 48.0, // 원하는 크기로 조절
                      child: Center(
                        child: Icon(
                          Icons.calendar_today, // 달력 모양의 아이콘
                          color: Color.fromRGBO(95, 94, 93, 1), // 아이콘 색상 설정
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 29),
              Row(
                children: [
                  Container(
                    width: 88,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(232, 183, 0, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 88,
                    height: 33,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(232, 183, 0, 1),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DiaryEditPage()),
                        );
                      },
                      child: const Icon(Icons.edit_outlined)),
                  const SizedBox(width: 10),
                  const Icon(Icons.delete_outline)
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(top: 8),
                height: 343,
                width: 364,
                color: Colors.transparent, // 연두색 설정
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '음 오늘은 늦게까지 일어나기 싫었다? 날이 너무 추워서 이불 속에만 있고 싶어. 근데 뭐 할 게 있으니까 일어나긴 해야지 그래서 내가 분명 일어나려고 했는데 어느새 다시 잠들어서 11시 반이 된 거야. 아놔 그래서 밥도 못 먹고 대충 씻고 나옴 근데 진짜 밖이 뼈 시리게 추운 거임 진짜 기절할 뻔 했음 아니 무슨 날씨가 왜 이럼 그래서 오늘 일 하는데 배가 어어어어엄청 고팠어 뭐 먹을 거라도 사 갔어야 했는데 아니 그냥 일찍 일어나서 밥을 먹었어야 했는데! 음 오늘은 늦게까지 일어나기 싫었다? 날이 너무 추워서 이불 속에만 있고 싶어. 근데 뭐 할 게 있으니까 일어나긴 해야지 그래서 내가 분명 일어나려고 했는데 어느새 다시 잠들어서 11시 반이 된 거야. 아놔 그래서 밥도 못 먹고 대충 씻고 나옴 근데 진짜 밖이 뼈 시리게 추운 거임 진짜 기절할 뻔 했음 아니 무슨 날씨가 왜 이럼 그래서 오늘 일 하는데 배가 어어어어엄청 고팠어 뭐 먹을 거라도 사 갔어야 했는데 아니 그냥 일찍 일어나서 밥을 먹었어야 했는데!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 54),
              Image.asset("assets/images/player.png"),
            ],
          ),
        ),
      ),
    );
  }
}
