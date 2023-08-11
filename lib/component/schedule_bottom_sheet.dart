import 'package:flutter/material.dart';
import 'package:flutter_calendar_scheduler/component/custom_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();

}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: CustomTextField(
            label: '시작 시간',
          ),
        )
    );
  }
}