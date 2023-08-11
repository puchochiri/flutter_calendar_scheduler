import 'package:flutter/material.dart';
import 'package:flutter_calendar_scheduler/component/main_calendar.dart';
import 'package:flutter_calendar_scheduler/component/schedule_card.dart';
import 'package:flutter_calendar_scheduler/component/today_banner.dart';
import 'package:flutter_calendar_scheduler/component/schedule_bottom_sheet.dart';
import 'package:flutter_calendar_scheduler/const/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc( // 선택된 날짜를 관리할 변수
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isDismissible: true,  // 배경 탭 했을 때 BottomSheet 닫기
              builder: (_) => ScheduleBottomSheet()
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(   // 시스템 UI 피해서  UI 구현하기
        child: Column(  // 달력과 리스트를 세로로 배치
          children: [
            //  미리 작업해둔 달력 위젯 보여주기
            MainCalendar(
              selectedDate: selectedDate, // 선택된 날짜 전달하기
              //날짜가 선택됐을 때 실행할 함수
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            TodayBanner(
              selectedDate: selectedDate,
              count: 0,
            ),
            SizedBox(height: 8.0),
            ScheduleCard(
                startTime: 12,
                endTime: 14,
                content: '프로그래밍 공부,'
            ),
          ],
        ),
      ),
    );
  }
  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    // 날짜 선택될 때마다 실행할 함수
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}