import 'package:chinese_calendar/chinese_datetime.dart';
import 'package:flutter/material.dart';
import 'package:lunar/calendar/LunarMonth.dart';
import 'package:lunar/calendar/LunarYear.dart';

class ChineseCalendarDelegate extends CalendarDelegate<ChineseDateTime> {
  @override
  ChineseDateTime addDaysToDate(ChineseDateTime date, int days) {
    return date.add(Duration(days: days));
  }

  @override
  ChineseDateTime addMonthsToMonthDate(
    ChineseDateTime monthDate,
    int monthsToAdd,
  ) {
    final initialLunarMonth = LunarMonth.fromYm(
      monthDate.year,
      monthDate.month,
    );
    final newLunarMonth = initialLunarMonth!.next(monthsToAdd);

    return ChineseDateTime(newLunarMonth.getYear(), newLunarMonth.getMonth());
  }

  @override
  String dateHelpText(MaterialLocalizations localizations) {
    return localizations.dateHelpText;
  }

  @override
  ChineseDateTime dateOnly(ChineseDateTime date) {
    return ChineseDateTime(date.year, date.month, date.day);
  }

  @override
  int firstDayOffset(int year, int month, MaterialLocalizations localizations) {
    return ChineseDateTime(year, month).lunar.getWeek();
  }

  @override
  String formatCompactDate(
    ChineseDateTime date,
    MaterialLocalizations localizations,
  ) {
    return localizations.formatCompactDate(date.toDateTime());
  }

  @override
  String formatFullDate(
    ChineseDateTime date,
    MaterialLocalizations localizations,
  ) {
    return date.lunar.toFullString();
  }

  @override
  String formatMediumDate(
    ChineseDateTime date,
    MaterialLocalizations localizations,
  ) {
    return localizations.formatMediumDate(date);
  }

  @override
  String formatMonthYear(
    ChineseDateTime date,
    MaterialLocalizations localizations,
  ) {
    return '${date.lunar.getMonthInChinese()} ${date.lunar.getYear()} (${date.lunar.getAnimal()})';
  }

  @override
  String formatShortDate(
    ChineseDateTime date,
    MaterialLocalizations localizations,
  ) {
    return localizations.formatShortDate(date.toDateTime());
  }

  @override
  String formatShortMonthDay(
    ChineseDateTime date,
    MaterialLocalizations localizations,
  ) {
    return localizations.formatShortMonthDay(date.toDateTime());
  }

  @override
  ChineseDateTime getDay(int year, int month, int day) {
    return ChineseDateTime(year, month, day);
  }

  @override
  int getDaysInMonth(int year, int month) {
    return ChineseDateTime(year, month).totalDays;
  }

  @override
  ChineseDateTime getMonth(int year, int month) {
    return ChineseDateTime(year, month);
  }

  @override
  int monthDelta(ChineseDateTime startDate, ChineseDateTime endDate) {
    if (startDate.year == endDate.year) {
      return endDate.month - startDate.month;
    }

    int months = 0;
    for (var year = startDate.year; year <= endDate.year; year++) {
      final lunarYear = LunarYear.fromYear(year);
      final monthsInYear = lunarYear.getMonthsInYear().length;

      if (year == startDate.year) {
        months += monthsInYear - startDate.month;
      } else if (year == endDate.year) {
        months += endDate.month;
      } else {
        months += monthsInYear;
      }
    }

    return months;
  }

  @override
  ChineseDateTime now() => ChineseDateTime.now();

  @override
  ChineseDateTime? parseCompactDate(
    String? inputString,
    MaterialLocalizations localizations,
  ) {
    return localizations.parseCompactDate(inputString)!.toChineseDateTime();
  }
}
