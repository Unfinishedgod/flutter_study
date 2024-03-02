import 'package:ch_17_calendar_scheduler_desktop/component/main_calendar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ch_17_calendar_scheduler_desktop/component/schedule_card.dart';
import 'package:ch_17_calendar_scheduler_desktop/component/schedule_bottom_sheet.dart';
import 'package:ch_17_calendar_scheduler_desktop/const/colors.dart';


class HomeScreen extends StatefulWidget {
  //  StatelessWidget 에서 StatefulWidget으로 전환
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton( // 새 일정 버튼
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet( // BottomSheet 열기
            context: context,
            isDismissible: true, // 배경 탭했을 때 bottomsheet 닫기
            builder: (_) => ScheduleBottomSheet(), 
            // BottomSheet의 높이를 화면의 최대 높이로
            // 정의하고 스크롤 가능하게 변경
            isScrollControlled: true,
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea( // 시스템 UI 피해서 UI 구현
        child: Column( // 달력과 리스트 세로로 배치
          children: [
            // 미리 작업해둔 달력 위젯 보여주기
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달

              // 날짜가 선택됐을 때 실행할 함수
              onDaySelected: onDaySelected,
            ),
            ScheduleCard(
              startTime: 13,
              endTime:14,
              content: '코딩 공부하기',
            ),
          ],
        ),
      ),
      // body: Text('Home Screen'),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    //  날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

}

