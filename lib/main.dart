import 'package:chinese_calendar/chinese_calendar_delegate.dart';
import 'package:chinese_calendar/chinese_datetime.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chinese Calendar',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Chinese Calendar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          _Result(date: _selectedDate),
          CalendarDatePicker(
            initialDate: ChineseDateTime.now(),
            firstDate: ChineseDateTime(2024, 5),
            lastDate: ChineseDateTime(2030, 12),
            calendarDelegate: ChineseCalendarDelegate(),
            onDateChanged: (date) {
              _selectedDate = date;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

class _Result extends StatelessWidget {
  const _Result({required this.date});

  final DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Selected Date:', textAlign: TextAlign.center),
              const SizedBox(height: 4),
              Text(
                date == null ? 'N/A' : date.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 4),
              Text(gregorianDate, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  String get gregorianDate {
    final dateTime = (date as ChineseDateTime?)?.toDateTime();
    return dateTime == null ? 'N/A' : DateFormat.yMMMMd().format(dateTime);
  }
}
