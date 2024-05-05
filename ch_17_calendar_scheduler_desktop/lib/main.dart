import 'package:ch_17_calendar_scheduler_desktop/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ch_17_calendar_scheduler_desktop/database/drift_database.dart';
import 'package:get_it/get_it.dart';
import 'package:ch_17_calendar_scheduler_desktop/provider/schedule_provider.dart';
import 'package:ch_17_calendar_scheduler_desktop/repository/schedule_repository.dart';
import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:ch_17_calendar_scheduler_desktop/firebase_options.dart';

void main() async {
  //  플러터 프레임워크가 준비될 때까지 대기 
  WidgetsFlutterBinding.ensureInitialized();

  // 파이어베이스 프로젝트 설정 함수
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDateFormatting(); // intl 패키지 초기화 (다국어화)

  // 데이터 베이스 생성
  final database = LocalDatabase(); // 데이터베이스 생성

  // GetIt에 데이터베이스 변수 주입하기
  GetIt.I.registerSingleton<LocalDatabase>(database);

  final repository = ScheduleRepository();
  final scheduleProvider = ScheduleProvider(repository: repository);

  runApp(
    ChangeNotifierProvider( // provider 하위 위젯에 제공하기
      create: (_) => scheduleProvider,
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}