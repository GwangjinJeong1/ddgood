import 'package:ddgood/diary.dart';
import 'package:flutter/material.dart';

import 'drawer/calendar.dart';
import 'convert.dart';
import 'drawer/drawer.dart';
import 'utils/color_scheme.dart';
import 'utils/text_theme.dart';

class DiaryEditPage extends StatefulWidget {
  const DiaryEditPage({
    super.key,
  });

  @override
  State<DiaryEditPage> createState() => _DiaryEditPageState();
}

class _DiaryEditPageState extends State<DiaryEditPage> {
  String content =
      '음 오늘은 늦게까지 일어나기 싫었다? 날이 너무 추워서 이불 속에만 있고 싶어. 근데 뭐 할 게 있으니까 일어나긴 해야지 그래서 내가 분명 일어나려고 했는데 어느새 다시 잠들어서 11시 반이 된 거야. 아놔 그래서 밥도 못 먹고 대충 씻고 나옴 근데 진짜 밖이 뼈 시리게 추운 거임 진짜 기절할 뻔 했음 아니 무슨 날씨가 왜 이럼 그래서 오늘 일 하는데 배가 어어어어엄청 고팠어 뭐 먹을 거라도 사 갔어야 했는데 아니 그냥 일찍 일어나서 밥을 먹었어야 했는데! 음 오늘은 늦게까지 일어나기 싫었다? 날이 너무 추워서 이불 속에만 있고 싶어. 근데 뭐 할 게 있으니까 일어나긴 해야지 그래서 내가 분명 일어나려고 했는데 어느새 다시 잠들어서 11시 반이 된 거야. 아놔 그래서 밥도 못 먹고 대충 씻고 나옴 근데 진짜 밖이 뼈 시리게 추운 거임 진짜 기절할 뻔 했음 아니 무슨 날씨가 왜 이럼 그래서 오늘 일 하는데 배가 어어어어엄청 고팠어 뭐 먹을 거라도 사 갔어야 했는데 아니 그냥 일찍 일어나서 밥을 먹었어야 했는데!';
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
                  SizedBox(
                    width: 88,
                    height: 33,
                    child: Container(
                      width: double.infinity,
                      height: 60,
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
                  ),
                  const SizedBox(width: 6),
                  SizedBox(
                    width: 88,
                    height: 33,
                    child: Container(
                      width: double.infinity,
                      height: 60,
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
                  ),
                ],
              ),
              const SizedBox(height: 21),
              Container(
                height: 419,
                width: 364,
                color: const Color.fromRGBO(255, 245, 205, 0.4),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: TextFormField(
                        key: const ValueKey(1),
                        maxLines: null,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45),
                          ),
                        ),
                        initialValue: content,
                        onChanged: (value) {},
                        onSaved: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                width: 343,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Colors.black),
                  child: const Text(
                    '수정 완료',
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
      ),
    );
  }
}
