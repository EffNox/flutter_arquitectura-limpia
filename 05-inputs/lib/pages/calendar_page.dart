import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _initialDate, _date;

  @override
  void initState() {
    super.initState();
    _initialDate = DateTime(1993, 2, 6);
    _date = _initialDate;

    while (!_selectableDayPredicate(_initialDate)) {
      _initialDate = _initialDate.add(const Duration(days: 1));
      _date = _initialDate;
    }
    if (!_selectableDayPredicate(_initialDate)) {
      debugPrint('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _selectTime,
            icon: const Icon(Icons.watch_outlined),
          ),
          IconButton(
            onPressed: _selectDate,
            icon: const Icon(Icons.calendar_month_outlined),
          ),
          IconButton(
            onPressed: _save,
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: CalendarDatePicker(
        initialDate: _date,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        // initialCalendarMode: DatePickerMode.year,
        selectableDayPredicate: _selectableDayPredicate,
        onDateChanged: (value) {
          _date = value;
        },
      ),
    );
  }

  bool _selectableDayPredicate(DateTime dateTime) {
    return dateTime.weekday != 6 && dateTime.weekday != 7;
  }

  void _save() {
    if (_date != _initialDate) {
      //
      debugPrint('_initialDate: $_initialDate');
    }
    Navigator.pop(context);
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900, 5),
      lastDate: DateTime.now(),
      builder: (_, child) =>
          WillPopScope(child: child!, onWillPop: () async => false),
      initialEntryMode: DatePickerEntryMode.input,
    );
    if (date != null) {
      _date = date;
      setState(() {});
    }
  }

  void _selectTime() async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (_, child) =>
          WillPopScope(child: child!, onWillPop: () async => false),
      initialEntryMode: TimePickerEntryMode.input,
      cancelText: 'Cancelar',
      confirmText: 'Aceptar',
      hourLabelText: 'Horas',
      minuteLabelText: 'Minutos',
    );
    if (time != null) debugPrint('time: $time');
  }
}
