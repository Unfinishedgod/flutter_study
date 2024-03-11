import 'package:ch_17_calendar_scheduler_desktop/model/schedule_model.dart';
import 'package:ch_17_calendar_scheduler_desktop/repository/schedule_repository.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScheduleProvider extends ChangeNotifier {
  final ScheduleRepository repository; // API 요청 로직을 담은 클래스

  DateTime selectedDate = DateTime.utc( // 선택한 날짜
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  Map<DateTime, List<ScheduleModel>> cache = {}; // 일정 정보를 저장해둘 변수

  ScheduleProvixer({
    required this.repository,
  }) : super() {
    getSchedules(date: selectedDate);
  }
}