import 'package:flutter/material.dart';

import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';
import 'drawer.dart';
import 'wordcloud_pages.dart';

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
            SizedBox(
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
      return DayPage(today: DateTime.now());
    case Calendar.week:
      return const WeekPage();
    case Calendar.month:
      return MonthPage(today: DateTime.now());
    default:
      return Container();
  }
}

