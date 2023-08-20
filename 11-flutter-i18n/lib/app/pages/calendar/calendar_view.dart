import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2050),
            onDateChanged: (value) {},
          ),
          ElevatedButton(onPressed: selectDateRange, child: const Text('Select date'))
        ],
      ),
    );
  }

  selectDateRange() => showDateRangePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050));
}
