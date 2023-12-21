import 'package:flutter/material.dart';

import 'components/components.dart';
import 'drawer/calendar.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 44),
              Text(
                '2023',
                style: bm17.copyWith(color: AppColor.text),
              ),
              Row(
                children: [
                  Text(
                    '12월 24일',
                    style: hb24.copyWith(color: AppColor.text),
                  ),
                  const SizedBox(width: 9),
                  GestureDetector(
                    onTap: () {
                      // 아이콘을 눌렀을 때 이동할 페이지로 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CalendarPage()),
                      );
                    },
                    child: SizedBox(
                      width: 30, // 원하는 크기로 조절
                      height: 30, // 원하는 크기로 조절
                      child: Center(
                          child: Image.asset("assets/images/uil_calender.png")),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 29),
              const Row(
                children: [
                  HashTag(content: '일어나', width: 88, height: 33, fontSize: 17),
                  SizedBox(width: 6),
                  HashTag(content: '추워', width: 88, height: 33, fontSize: 17),
                ],
              ),
              const SizedBox(height: 21),
              Stack(
                children: [
                  Container(
                    height: 432,
                    width: 364,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 0.4),
                      border: Border.all(
                        color: const Color.fromRGBO(224, 224, 224, 1),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 21, left: 23, right: 23),
                      child: SingleChildScrollView(
                        child: TextFormField(
                          key: const ValueKey(1),
                          maxLines: null,
                          initialValue: content,
                          onChanged: (value) {},
                          onSaved: (value) {},
                          style: bm15.copyWith(color: AppColor.text),
                          cursorColor: Colors.black, // 여기에 추가
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 393,
                      height: 36,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(250, 248, 244, 0.00), // 투명
                            Color(0xFFFAF8F4), // #FAF8F4
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
