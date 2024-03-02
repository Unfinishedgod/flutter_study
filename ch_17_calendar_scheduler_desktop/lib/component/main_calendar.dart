import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime(1800, 1, 1), // 첫째날
      lastDay: DateTime(3000, 1, 1), // 마지막 날
      focusedDay: DateTime.now(),  // 화면에 보여지는 날

    );
  }
  
}
