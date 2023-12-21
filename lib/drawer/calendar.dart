import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../main.dart';
import 'wordcloud.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _today = DateTime.now();
  int countDiary = 15;

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
      body: Padding(
        padding: const EdgeInsets.only(left: 17, top: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MonthCalendar(
              today: _today,
              onMonthChanged: (newMonth) {
                setState(() {
                  _today = DateTime(newMonth.year, newMonth.month, _today.day);
                });
              },
            ),
            const SizedBox(height: 60),
            Text("이번 달 $countDiary번의 일기를 기록했어요",
                style: const TextStyle(fontSize: 17)),
          ],
        ),
      ),
    );
  }
}

class MonthCalendar extends StatefulWidget {
  const MonthCalendar(
      {super.key, required this.today, required this.onMonthChanged});

  final DateTime today;
  final ValueChanged<DateTime> onMonthChanged;

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late DateTime _today;
  late String month;
  final List<DateTime> _selectedDays = [
    DateTime(2023, 12, 3),
    DateTime(2023, 12, 5),
    DateTime(2023, 12, 19),
    DateTime(2023, 12, 20)
  ];

  @override
  void initState() {
    super.initState();
    _today = widget.today;
    month = DateFormat('M월', 'ko_KR').format(_today);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _today =
                        DateTime(_today.year, _today.month - 1, _today.day);
                    month = DateFormat('M월', 'ko_KR').format(_today);
                    widget.onMonthChanged(_today);
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_left_rounded),
              ),
              Text(month,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  setState(() {
                    _today =
                        DateTime(_today.year, _today.month + 1, _today.day);
                    month = DateFormat('M월', 'ko_KR').format(_today);
                    widget.onMonthChanged(_today);
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        weekdays(),
        TableCalendar(
          focusedDay: _today,
          firstDay: DateTime(_today.year, _today.month),
          lastDay: DateTime(_today.year, _today.month + 1, 0),
          headerVisible: false,
          daysOfWeekVisible: false,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: false,
            todayDecoration: BoxDecoration(
                color: _selectedDays.contains(_today)
                    ? Color(0xffD9D9D9)
                    : Colors.transparent,
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(25)),
            selectedDecoration: BoxDecoration(
                color: Color(0xffD9D9D9),
                border: _selectedDays.contains(_today)
                    ? Border.all(width: 2)
                    : null,
                borderRadius: BorderRadius.circular(25)),
            todayTextStyle: const TextStyle(fontSize: 16),
            selectedTextStyle: const TextStyle(fontSize: 16),
            defaultTextStyle: const TextStyle(fontSize: 16),
            weekendTextStyle: const TextStyle(fontSize: 16),
          ),
          selectedDayPredicate: (day) =>
              _selectedDays.any((selectedDay) => isSameDay(selectedDay, day)),
        ),
      ],
    );
  }

  Widget weekdays() {
    List<String> week = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: week.map((day) {
        return SizedBox(
          width: 30,
          height: 30,
          child: Text(day),
        );
      }).toList(),
    );
  }
}
