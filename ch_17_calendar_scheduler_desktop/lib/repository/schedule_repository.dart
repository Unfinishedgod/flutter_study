import 'dart:async';
import 'dart:io';

import 'package:ch_17_calendar_scheduler_desktop/model/schedule_model.dart';
import 'package:dio/dio.dart';

class ScheduleRepository {
  final _dio = Dio();
  // 안드로이드에서는 10.0.2.2가 localhost에 해당함
  final _targetUrl = 'http://${Platform.isAndroid ? '10.0.2.2' : 'localhost'}:3000/schedule';

  Future<List<ScheduleModel>> getSchedules({
    required DateTime date, 
  }) async {
    final resp = await _dio.get(
      _targetUrl,
      queryParameters: { // Query 매개변수
        'date':'${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2,'0')}',
      },
    );

    return resp.data // 모델 인스턴스로 데이터 매핑하기
        .map<ScheduleModel>(
          (x) => ScheduleModel.fromJson(
            json: x,
          ),
        )
            .toList();
  } 
}