import 'package:flutter/material.dart';

import '../components/components.dart';
import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';
import 'drawer.dart';

enum Calendar { day, week, month }

class WordCloudPage extends StatefulWidget {
  const WordCloudPage({
    super.key,
  });

  @override
  State<WordCloudPage> createState() => _WordCloudPageState();
}

class _WordCloudPageState extends State<WordCloudPage> {
  Calendar calendarView = Calendar.day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.secondary,
        title: const Text('워드클라우드', style: hm21),
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
        child: Column(
          children: [
            const SizedBox(height: 41),
            Container(
              width: 340,
              child: SegmentedButton<Calendar>(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  textStyle: MaterialStateProperty.all(bs17),
                  backgroundColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return AppColor.tertiery;
                    } else {
                      return Colors.transparent;
                    }
                  }),
                  side: MaterialStateProperty.resolveWith((states) {
                    return const BorderSide(color: AppColor.primary, width: 1);
                  }),
                ),
                segments: const <ButtonSegment<Calendar>>[
                  ButtonSegment<Calendar>(
                    value: Calendar.day,
                    label: Text('일'),
                  ),
                  ButtonSegment<Calendar>(
                    value: Calendar.week,
                    label: Text('주'),
                  ),
                  ButtonSegment<Calendar>(
                    value: Calendar.month,
                    label: Text('월'),
                  ),
                ],
                selected: <Calendar>{calendarView},
                onSelectionChanged: (Set<Calendar> newSelection) {
                  setState(() {
                    calendarView = newSelection.first;
                  });
                },
                showSelectedIcon: false,
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/Shine.png",
                  width: 410,
                  height: 587,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 27,
                  child: getHeaderWidget(calendarView),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget getHeaderWidget(Calendar calendarView) {
  switch (calendarView) {
    case Calendar.day:
      return SizedBox(
        width: 393,
        child: Column(
          children: [
            Text(
              '12월',
              style: bs15.copyWith(color: AppColor.text),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.navigate_before, size: 24),
                const SizedBox(width: 28),
                Text(
                  '22일',
                  style: hb24.copyWith(color: AppColor.text),
                ),
                const SizedBox(width: 28),
                const Icon(Icons.navigate_next, size: 24),
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
                          text: '칙칙',
                          style: bm17.copyWith(color: AppColor.text)),
                      const TextSpan(text: '님이 언급한\n이 날의 메인 키워드예요'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 66),
            const HashTag(content: '추워', width: 197, height: 52, fontSize: 28),
            const SizedBox(height: 16),
            const HashTag(
                content: '느릿느릿', width: 197, height: 52, fontSize: 28),
            const SizedBox(height: 159),
            SizedBox(
              width: 343,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: AppColor.button),
                child: Text('다른 날 선택하기',
                    style: bs17.copyWith(color: AppColor.text)),
              ),
            ),
          ],
        ),
      );
    case Calendar.week:
      return SizedBox(
        width: 393,
        child: Column(
          children: [
            Text(
              '12월',
              style: bs15.copyWith(color: AppColor.text),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.navigate_before, size: 24),
                const SizedBox(width: 28),
                Text(
                  '4주',
                  style: hb24.copyWith(color: AppColor.text),
                ),
                const SizedBox(width: 28),
                const Icon(Icons.navigate_next, size: 24),
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
                          text: '칙칙',
                          style: bm17.copyWith(color: AppColor.text)),
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
            const HashTag(
                content: '느릿느릿', width: 197, height: 52, fontSize: 28),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: AppColor.button),
                child: Text('다른 날 선택하기',
                    style: bs17.copyWith(color: AppColor.text)),
              ),
            ),
          ],
        ),
      );
    case Calendar.month:
      return SizedBox(
        width: 393,
        child: Column(
          children: [
            Text(
              '2023',
              style: bs15.copyWith(color: AppColor.text),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.navigate_before, size: 24),
                const SizedBox(width: 28),
                Text(
                  '12월',
                  style: hb24.copyWith(color: AppColor.text),
                ),
                const SizedBox(width: 28),
                const Icon(Icons.navigate_next, size: 24),
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
                          text: '칙칙',
                          style: bm17.copyWith(color: AppColor.text)),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: AppColor.button),
                child: Text('다른 날 선택하기',
                    style: bs17.copyWith(color: AppColor.text)),
              ),
            ),
          ],
        ),
      );
    default:
      return Container();
  }
}
