import 'package:flutter/material.dart';

class ScehduleModel {
  final String id;
  final String content;
  final DateTime date;
  final int startTime;
  final int endTime;


  ScheduleModel({
    required this.id,
    required this.content,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  ScheduleModel.fromJson({ // JSON으로 부터 모델을 만들어내는 생성자
    required Map<String, dynamic> json, 
  })  : id = json['id'],
        content = json['content'],
        date = DateTime.parse(json['date']),
        startTime = json['startTime'],
        endTime = json['endTime'];

  Map<String, dynamic> toJson() { // 모델을 다시 JSON으로 변환
    return {
      'id': id, 
      'content': content, 
      'date': '${date.year}${date.month.toString().padLeft(2, '0')}${date.day.toString().padLeft(2,'0')}',
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  ScheduleModel copyWith({ // 

  })

}