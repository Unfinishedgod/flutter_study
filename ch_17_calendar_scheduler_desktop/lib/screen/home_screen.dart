import 'dart:ui';

import 'package:ch_17_calendar_scheduler_desktop/component/main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ch_17_calendar_scheduler_desktop/component/schedule_card.dart';
import 'package:ch_17_calendar_scheduler_desktop/component/schedule_bottom_sheet.dart';
import 'package:ch_17_calendar_scheduler_desktop/const/colors.dart';
import 'package:get_it/get_it.dart';
import 'package:ch_17_calendar_scheduler_desktop/database/drift_database.dart';
import 'package:ch_17_calendar_scheduler_desktop/component/today_banner.dart';
import 'package:provider/provider.dart';
import 'package:ch_17_calendar_scheduler_desktop/provider/schedule_provider.dart';


// class HomeScreen extends StatefulWidget {
//   // ➊ StatelessWidget에서 StatefulWidget으로 전환
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {

class HomeScreen extends StatelessWidget {
  DateTime selectedDate = DateTime.utc(
    // ➋ 선택된 날짜를 관리할 변수
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {

    // 프로바이더 변경이 있을 때마다 build() 함수 재실행
    final provider = context.watch<ScheduleProvider>();

    // 선택된 날짜 가져오기
    final selectedDate = provider.selectedDate;

    // 선택된 날짜에 해당되는 일정들 가져오기
    final schedules = provider.cache[selectedDate] ?? [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        // ➊ 새 일정 버튼
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
            // ➋ BottomSheet 열기
            context: context,
            isDismissible: true, // ➌ 배경 탭했을 때 BottomSheet 닫기
            isScrollControlled: true,
            builder: (_) => ScheduleBottomSheet(
              selectedDate: selectedDate, // 선택된 날짜 (selectedDate) 넘겨주기
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        // 시스템 UI 피해서 UI 구현하기
        child: Column(
          // 달력과 리스트를 세로로 배치
          children: [
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달하기

              // 날짜가 선택됐을 때 실행할 함수
              onDaySelected: (selectedDate, focusedDate) =>
                  onDaySelected(selectedDate, focusedDate, context),
            ),
            SizedBox(height: 8.0),
            // build() 함수 내부의 TodayBanner 위젯
            TodayBanner(
              selectedDate: selectedDate,
              count: schedules.length,
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: schedules.length,
                itemBuilder: (context, index) {
                  final schedule = schedules[index];

                  return Dismissible(
                    key: ObjectKey(schedule.id),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (DismissDirection direction) {
                      provider.deleteSchedule(date: selectedDate, id: schedule.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        bottom:8.0, left: 8.0, right: 8.0),
                      child: ScheduleCard(
                        startTime: schedule.startTime,
                        endTime: schedule.endTime,
                        content: schedule.content,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(
    DateTime selectedDate, 
    DateTime focusedDate,
    BuildContext context) {
      final provider = context.read<ScheduleProvider>();
      provider.changeSelectedDate(
        date: selectedDate,
      );
      provider.getSchedules(date: selectedDate);
    // ➌ 날짜 선택될 때마다 실행할 함수
    // setState(() {
    //   this.selectedDate = selectedDate;
    // });
  }
}