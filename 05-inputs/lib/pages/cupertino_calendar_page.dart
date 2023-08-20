import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoCalendarPage extends StatefulWidget {
  const CupertinoCalendarPage({Key? key}) : super(key: key);

  @override
  State<CupertinoCalendarPage> createState() => _CupertinoCalendarPageState();
}

class _CupertinoCalendarPageState extends State<CupertinoCalendarPage> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();
    _date = DateTime(2021);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_outlined),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: _date,
              minimumDate: DateTime(1900),
              maximumDate: DateTime.now(),
              onDateTimeChanged: (date) {
                _date = date;
                setState(() {});
              },
            ),
          ),
        ],
      )),
    );
  }
}
