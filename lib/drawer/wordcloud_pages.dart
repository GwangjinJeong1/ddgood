import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../components/components.dart';
import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';
import 'modalPage.dart';

class MonthPage extends StatefulWidget {
  const MonthPage({super.key, required this.today});

  final DateTime today;

  @override
  State<MonthPage> createState() => _MonthPageState();
}

class _MonthPageState extends State<MonthPage> {
  late DateTime _today;
  late String month;

  @override
  void initState() {
    super.initState();
    _today = widget.today;
    month = DateFormat('M월', 'ko_KR').format(_today);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393,
      child: Column(
        children: [
          Text(
            '${_today.year}년',
            style: bs15.copyWith(color: AppColor.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _today =
                        DateTime(_today.year, _today.month - 1, _today.day);
                    month = DateFormat('M월', 'ko_KR').format(_today);
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_left_rounded),
              ),
              Text(month, style: hb24.copyWith(color: AppColor.text)),
              IconButton(
                onPressed: () {
                  setState(() {
                    _today =
                        DateTime(_today.year, _today.month + 1, _today.day);
                    month = DateFormat('M월', 'ko_KR').format(_today);
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
          const SizedBox(height: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 27),
              RichText(
                text: TextSpan(
                  style: bs15.copyWith(color: AppColor.text),
                  children: [
                    TextSpan(
                        text: '칙칙', style: bm17.copyWith(color: AppColor.text)),
                    const TextSpan(text: '님이 언급한\n이 날의 메인 키워드예요'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 67),
          Image.asset("assets/images/words.png"),
          const SizedBox(height: 115),
          SizedBox(
            width: 343,
            height: 60,
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => CalendarModal(today: DateTime.now())),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: AppColor.button),
              child:
                  Text('다른 날 선택하기', style: bs17.copyWith(color: AppColor.text)),
            ),
          ),
        ],
      ),
    );
  }
}

class WeekPage extends StatelessWidget {
  const WeekPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393,
      child: Column(
        children: [
          Text(
            '12월',
            style: bs15.copyWith(color: AppColor.text),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.navigate_before, size: 24),
              const SizedBox(width: 20),
              Text(
                '4주',
                style: hb24.copyWith(color: AppColor.text),
              ),
              const SizedBox(width: 20),
              const Icon(Icons.navigate_next, size: 24),
            ],
          ),
          const SizedBox(height: 38),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 27),
              RichText(
                text: TextSpan(
                  style: bs15.copyWith(color: AppColor.text),
                  children: [
                    TextSpan(
                        text: '칙칙', style: bm17.copyWith(color: AppColor.text)),
                    const TextSpan(text: '님이 언급한\n이 달의 메인 키워드예요'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 57),
          const Row(
            children: [
              SizedBox(width: 27),
              HashTag(content: '추워', width: 197, height: 52, fontSize: 28),
            ],
          ),
          const SizedBox(height: 16),
          const HashTag(content: '느릿느릿', width: 197, height: 52, fontSize: 28),
          const SizedBox(height: 12),
          const Row(
            children: [
              SizedBox(width: 170),
              HashTag(content: '겨울잠', width: 197, height: 52, fontSize: 28),
            ],
          ),
          const SizedBox(height: 104),
          SizedBox(
            width: 343,
            height: 60,
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => CalendarModal(today: DateTime.now())),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: AppColor.button),
              child:
                  Text('다른 날 선택하기', style: bs17.copyWith(color: AppColor.text)),
            ),
          ),
        ],
      ),
    );
  }
}

class DayPage extends StatefulWidget {
  const DayPage({super.key, required this.today});

  final DateTime today;

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  late DateTime _today;
  late String day;

  @override
  void initState() {
    super.initState();
    _today = widget.today;
    day = DateFormat('dd일', 'ko_KR').format(_today);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393,
      child: Column(
        children: [
          Text(
            '${_today.month}월',
            style: bs15.copyWith(color: AppColor.text),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _today =
                        DateTime(_today.year, _today.month, _today.day - 1);
                    day = DateFormat('d일', 'ko_KR').format(_today);
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_left_rounded),
              ),
              Text(day, style: hb24.copyWith(color: AppColor.text)),
              IconButton(
                onPressed: () {
                  setState(() {
                    _today =
                        DateTime(_today.year, _today.month, _today.day + 1);
                    day = DateFormat('d일', 'ko_KR').format(_today);
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
          const SizedBox(height: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 27),
              RichText(
                text: TextSpan(
                  style: bs15.copyWith(color: AppColor.text),
                  children: [
                    TextSpan(
                        text: '칙칙', style: bm17.copyWith(color: AppColor.text)),
                    const TextSpan(text: '님이 언급한\n이 날의 메인 키워드예요'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 66),
          const HashTag(content: '추워', width: 197, height: 52, fontSize: 28),
          const SizedBox(height: 16),
          const HashTag(content: '느릿느릿', width: 197, height: 52, fontSize: 28),
          const SizedBox(height: 159),
          SizedBox(
            width: 343,
            height: 60,
            child: ElevatedButton(
              onPressed: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => CalendarModal(today: DateTime.now())),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: AppColor.button),
              child:
                  Text('다른 날 선택하기', style: bs17.copyWith(color: AppColor.text)),
            ),
          ),
        ],
      ),
    );
  }
}
