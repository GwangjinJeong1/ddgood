import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/color_scheme.dart';
import '../utils/text_theme.dart';

// 일기를 작성한 날짜 list(임시)
final List<DateTime> _selectedDays = [
  DateTime(2023, 12, 5),
  DateTime(2023, 12, 6),
  DateTime(2023, 12, 7),
  DateTime(2023, 12, 8),
  DateTime(2023, 12, 9),
  DateTime(2023, 12, 10),
  DateTime(2023, 12, 11),
  DateTime(2023, 12, 12),
  DateTime(2023, 12, 14),
  DateTime(2023, 12, 15),
  DateTime(2023, 12, 16),
  DateTime(2023, 12, 18),
  DateTime(2023, 12, 24),
  DateTime(2023, 12, 25),
  DateTime(2023, 12, 26)
];

class CalendarModal extends StatefulWidget {
  const CalendarModal({super.key, required this.today});

  final DateTime today;

  @override
  State<CalendarModal> createState() => _CalendarModalState();
}

class _CalendarModalState extends State<CalendarModal> {
  late DateTime _today;
  late int _selectedYear;
  late int _selectedMonth;
  final List<int> _years = [2020, 2021, 2022, 2023];
  final List<int> _months = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

  @override
  void initState() {
    super.initState();
    _today = widget.today;
    _selectedYear = _today.year;
    _selectedMonth = _today.month;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 20, 0),
      width: size.width,
      height: size.height * 0.64,
      child: Column(
        children: [
          Row(
            children: [
              // 연도 dropdown
              DropdownButton2(
                hint: Text('$_selectedYear', style: bs17),
                items: _years
                    .map((item) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: item,
                        child: Text('$item',
                            style: _selectedYear == item ? bs15 : br15)))
                    .toList(),
                value: _selectedYear,
                onChanged: (value) {
                  setState(() {
                    _selectedYear = value!;
                    _today = DateTime(_selectedYear, _today.month);
                  });
                },
                underline: const SizedBox(),
                buttonStyleData: ButtonStyleData(
                    width: 93,
                    height: 32,
                    padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.stroke),
                        borderRadius: BorderRadius.circular(8))),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 30,
                ),
              ),
              const SizedBox(width: 11),
              // 월 dropdown
              DropdownButton2(
                hint: Text('$_selectedMonth', style: bs17),
                items: _months
                    .map((item) => DropdownMenuItem(
                        alignment: Alignment.center,
                        value: item,
                        child: Text('$item',
                            style: _selectedMonth == item ? bs15 : br15)))
                    .toList(),
                value: _selectedMonth,
                onChanged: (value) {
                  setState(() {
                    _selectedMonth = value!;
                    _today = DateTime(_today.year, _selectedMonth);
                  });
                },
                underline: const SizedBox(),
                buttonStyleData: ButtonStyleData(
                    width: 69,
                    height: 32,
                    padding: const EdgeInsets.fromLTRB(16, 4, 8, 4),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColor.stroke),
                        borderRadius: BorderRadius.circular(8))),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: size.width,
            child: TableCalendar(
              focusedDay: _today,
              firstDay: DateTime(_today.year, _today.month),
              lastDay: DateTime(_today.year, _today.month + 1, 0),
              headerVisible: false,
              daysOfWeekStyle:
                  const DaysOfWeekStyle(weekdayStyle: bs15, weekendStyle: bs15),
              calendarStyle: CalendarStyle(
                outsideDaysVisible: false,
                todayDecoration: BoxDecoration(
                    color: _selectedDays.contains(_today)
                        ? AppColor.button
                        : Colors.transparent,
                    border: Border.all(width: 2, color: AppColor.primary),
                    borderRadius: BorderRadius.circular(25)),
                selectedDecoration: BoxDecoration(
                    color: AppColor.button,
                    border: _selectedDays.contains(_today)
                        ? Border.all(width: 2)
                        : null,
                    borderRadius: BorderRadius.circular(25)),
                todayTextStyle: br15,
                selectedTextStyle: br15,
                defaultTextStyle: br15,
                weekendTextStyle: br15,
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _today = selectedDay;
                });
              },
              selectedDayPredicate: (day) => _selectedDays
                  .any((selectedDay) => isSameDay(selectedDay, day)),
            ),
          ),
          SizedBox(
            width: size.width - 50,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  backgroundColor: AppColor.secondary),
              child: Text('완료', style: bs17.copyWith(color: AppColor.neutral)),
            ),
          ),
        ],
      ),
    );
  }
}
