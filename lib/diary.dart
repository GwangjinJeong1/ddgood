import 'package:flutter/material.dart';

import 'components/components.dart';
import 'drawer/calendar.dart';
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
        backgroundColor: AppColor.secondary,
        title: const Text('오늘의 일기', style: hm21),
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
                  Text('12월 24일', style: hb24.copyWith(color: AppColor.text)),
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
                        child: Icon(Icons.calendar_today, // 달력 모양의 아이콘
                            color: AppColor.text // 아이콘 색상 설정
                            ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 29),
              Row(
                children: [
                  const HashTag(
                      content: '일어나', width: 88, height: 33, fontSize: 17),
                  const SizedBox(width: 6),
                  const HashTag(
                      content: '추워', width: 88, height: 33, fontSize: 17),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DiaryEditPage()),
                        );
                      },
                      child: const Icon(Icons.edit_outlined,
                          color: AppColor.text, size: 27)),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              const DeleteDialog()),
                      icon: const Icon(Icons.delete_outline),
                      color: AppColor.text)
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.only(top: 8),
                height: 343,
                width: 364,
                child: const SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '음 오늘은 늦게까지 일어나기 싫었다? 날이 너무 추워서 이불 속에만 있고 싶어. 근데 뭐 할 게 있으니까 일어나긴 해야지 그래서 내가 분명 일어나려고 했는데 어느새 다시 잠들어서 11시 반이 된 거야. 아놔 그래서 밥도 못 먹고 대충 씻고 나옴 근데 진짜 밖이 뼈 시리게 추운 거임 진짜 기절할 뻔 했음 아니 무슨 날씨가 왜 이럼 그래서 오늘 일 하는데 배가 어어어어엄청 고팠어 뭐 먹을 거라도 사 갔어야 했는데 아니 그냥 일찍 일어나서 밥을 먹었어야 했는데! 음 오늘은 늦게까지 일어나기 싫었다? 날이 너무 추워서 이불 속에만 있고 싶어. 근데 뭐 할 게 있으니까 일어나긴 해야지 그래서 내가 분명 일어나려고 했는데 어느새 다시 잠들어서 11시 반이 된 거야. 아놔 그래서 밥도 못 먹고 대충 씻고 나옴 근데 진짜 밖이 뼈 시리게 추운 거임 진짜 기절할 뻔 했음 아니 무슨 날씨가 왜 이럼 그래서 오늘 일 하는데 배가 어어어어엄청 고팠어 뭐 먹을 거라도 사 갔어야 했는데 아니 그냥 일찍 일어나서 밥을 먹었어야 했는데!',
                          textAlign: TextAlign.left,
                          style: bm15),
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

class DeleteDialog extends StatefulWidget {
  const DeleteDialog({super.key});

  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(26, 20, 26, 20) ,
      actionsPadding: const EdgeInsets.only(right: 20, bottom: 20),
      backgroundColor: AppColor.neutral,
      title: Text('일기 삭제', style: hs21.copyWith(color: AppColor.text)),
      content: const Text('일기를 정말 삭제하시겠어요?', style: bm15),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop('삭제');
          },
          child: Text('삭제', style: bs15.copyWith(color: AppColor.primary)),
        )
      ],
    );
  }
}
