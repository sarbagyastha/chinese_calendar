import 'package:lunar/calendar/Lunar.dart';
import 'package:lunar/calendar/LunarMonth.dart';

class ChineseDateTime implements DateTime {
  ChineseDateTime(
    this.year, [
    this.month = 1,
    this.day = 1,
    this.hour = 0,
    this.minute = 0,
    this.second = 0,
    this.millisecond = 0,
    this.microsecond = 0,
  ]);

  factory ChineseDateTime.now() => DateTime.now().toChineseDateTime();

  @override
  final int year;

  @override
  final int month;

  @override
  final int day;

  @override
  final int hour;

  @override
  final int minute;

  @override
  final int second;

  @override
  final int millisecond;

  @override
  final int microsecond;

  @override
  int get weekday => toDateTime().weekday % 7 + 1;

  @override
  bool isAfter(covariant ChineseDateTime other) =>
      toDateTime().isAfter(other.toDateTime());

  @override
  bool isBefore(covariant ChineseDateTime other) =>
      toDateTime().isBefore(other.toDateTime());

  @override
  Duration difference(covariant ChineseDateTime other) =>
      toDateTime().difference(other.toDateTime());

  @override
  ChineseDateTime add(Duration duration) =>
      toDateTime().add(duration).toChineseDateTime();

  @override
  ChineseDateTime subtract(Duration duration) =>
      toDateTime().subtract(duration).toChineseDateTime();

  @override
  int get millisecondsSinceEpoch => toDateTime().millisecondsSinceEpoch;

  @override
  int get microsecondsSinceEpoch => toDateTime().microsecondsSinceEpoch;

  @override
  String toString() => lunar.toString();

  @override
  String toIso8601String() => toDateTime().toIso8601String();

  @override
  int compareTo(covariant ChineseDateTime other) =>
      toDateTime().compareTo(other.toDateTime());

  @override
  bool isAtSameMomentAs(covariant ChineseDateTime other) =>
      millisecondsSinceEpoch == other.millisecondsSinceEpoch;

  @override
  bool get isUtc => false;

  @override
  String get timeZoneName => 'CST';

  @override
  Duration get timeZoneOffset => const Duration(hours: 8);

  @override
  ChineseDateTime toLocal() => this;

  @Deprecated('Non operational')
  @override
  DateTime toUtc() => throw UnimplementedError();

  DateTime toDateTime() {
    final solar = lunar.getSolar();
    return DateTime(
      solar.getYear(),
      solar.getMonth(),
      solar.getDay(),
      solar.getHour(),
      solar.getMinute(),
      solar.getSecond(),
      millisecond,
      microsecond,
    );
  }

  int get totalDays => LunarMonth.fromYm(year, month)!.getDayCount();

  Lunar get lunar => Lunar.fromYmdHms(year, month, day, hour, minute, second);
}

extension ChineseDateTimeExtension on DateTime {
  ChineseDateTime toChineseDateTime() {
    final lunar = Lunar.fromDate(toLocal());

    return ChineseDateTime(
      lunar.getYear(),
      lunar.getMonth(),
      lunar.getDay(),
      lunar.getHour(),
      lunar.getMinute(),
      lunar.getSecond(),
      millisecond,
      microsecond,
    );
  }
}
