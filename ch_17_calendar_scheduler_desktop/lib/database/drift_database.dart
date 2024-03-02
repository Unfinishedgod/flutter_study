import 'package:ch_17_calendar_scheduler_desktop/model/schedule.dart';
import 'package:drift/drift.dart';

import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

//  private 값 까지 불러올 수 있음
part 'drift_database.g.dart'; // part 파일 지정

@DriftDatabase( // 사용할 테이블 등록
  tables: [
    Schedules,
  ],
)

class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());
  
  // watch 함수
  Stream<List<Schedule>> watchSchedules(DateTime date) => 
  // 데이터를 조회하고 변화 감지
      (select(schedules)..where((tbl) => tbl.date.equals(date))).watch();
  
  // insert 함수
  Future<int> createSchedule(SchedulesCompanion data) =>
      into(schedules).insert(data);
  
  // delete 함수
  Future<int> removeSchedule(int id) =>
      (delete(schedules)..where((tbl) => tbl.id.equals(id))).go();

  //
  @override
  int get schemaVersion => 1;

}
// Code generation 으로 생성할 클래스 상속

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    
    // 데이터베이스 파일 저장할 폴더
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}