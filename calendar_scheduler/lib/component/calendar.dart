import 'package:calendar_scheduler/const/color.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatelessWidget {
  final DateTime focusedDay;
  final OnDaySelected onDaySelected;
  final bool Function(DateTime day) selectedDayPredicate;

  const Calendar({super.key, required this.focusedDay, required this.onDaySelected, required this.selectedDayPredicate});

  @override
  Widget build(BuildContext context) {
    final defaultBoxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1.0,
        )
    );

    final defaultTextStyle = TextStyle(
      color: Colors.grey[600],
      fontWeight: FontWeight.w700,
    );

    return TableCalendar(
      locale: 'Ko_KR',
      focusedDay: focusedDay,
      firstDay: DateTime(1800),
      lastDay: DateTime(3000),
      headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
          )
      ),
      calendarStyle: CalendarStyle(
          isTodayHighlighted: true,
          defaultDecoration: defaultBoxDecoration,
          weekendDecoration: defaultBoxDecoration,
          selectedDecoration: defaultBoxDecoration.copyWith(
              border: Border.all(
                color: primaryColor,
                width: 1.0,
              )
          ),
          defaultTextStyle: defaultTextStyle,
          weekendTextStyle: defaultTextStyle,
          selectedTextStyle: defaultTextStyle.copyWith(
            color: primaryColor,
          ),
          todayDecoration: defaultBoxDecoration.copyWith(
            color: primaryColor,
          ),
          outsideDecoration: defaultBoxDecoration.copyWith(
              border: Border.all(
                color: Colors.transparent,
              )
          )
      ),
      onDaySelected: onDaySelected,
      selectedDayPredicate: selectedDayPredicate
    );
  }
}
