import 'package:ch_17_calendar_scheduler_desktop/component/main_calendar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // 시스템 UI 피해서 UI 구현
        child: Column( // 달력과 리스트 세로로 배치
          children: [
            // 미리 작업해둔 달력 위젯 보여주기
            MainCalendar(),
          ],
        )
      )
      // body: Text('Home Screen'),
    );
  }
}