import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_widget_model.dart';
import 'package:flutter_base/pages/planning_page/planning_viewmodel.dart';
import 'package:flutter_base/utils/extension.dart';
import 'package:provider/provider.dart';

import '../../models/calendar_event.dart';
import '../../pages/planning_page/controller/calendar_state_controller.dart';
import '../../pages/planning_page/controller/cell_calendar_page_controller.dart';
import 'day_row/day_rows.dart';
import 'days_of_the_week.dart';
import 'month_year_label.dart';

typedef daysBuilder = Widget Function(int dayIndex);

/// Calendar widget like a Google Calendar
///
/// Expected to be used in full screen
class CellCalendar extends StatelessWidget {
  CellCalendar({
    required this.cellCalendarPageController,
    this.events = const [],
    this.onPageChanged,
  });

  final CellCalendarPageController cellCalendarPageController;

  final List<CalendarEvent> events;
  final void Function(DateTime firstDate, DateTime lastDate)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return _CalendarPageView(
      cellCalendarPageController,
    );
  }
}

class _CalendarPageView extends BaseWidgetModel<PlanningViewModel> {
  _CalendarPageView(this.cellCalendarPageController);

  late CalendarStateController _calendarStateControl;
  final CellCalendarPageController cellCalendarPageController;

  @override
  Widget build(BuildContext context, PlanningViewModel widgetModel) {
    _calendarStateControl =
        Provider.of<CalendarStateController>(context, listen: true);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MonthYearLabel(cellCalendarPageController),
        Expanded(
          child: PageView.builder(
            controller: cellCalendarPageController,
            itemBuilder: (context, index) {
              return _CalendarPage(index.visibleDateTime);
            },
            onPageChanged: (index) {
              Provider.of<CalendarStateController>(context, listen: false)
                  .onPageChanged(index);
            },
          ),
        ),
      ],
    );
  }
}

class _CalendarPage extends StatelessWidget {
  const _CalendarPage(
    this.visiblePageDate, {
    Key? key,
  }) : super(key: key);

  final DateTime visiblePageDate;

  List<DateTime> _getCurrentDays(DateTime dateTime) {
    final List<DateTime> result = [];
    final firstDay = _getFirstDay(dateTime);
    result.add(firstDay);
    for (int i = 0; i + 1 < 42; i++) {
      result.add(firstDay.add(Duration(days: i + 1)));
    }
    return result;
  }

  DateTime _getFirstDay(DateTime dateTime) {
    final firstDayOfTheMonth = DateTime(dateTime.year, dateTime.month, 1);
    return firstDayOfTheMonth.add(firstDayOfTheMonth.weekday.daysDuration);
  }

  @override
  Widget build(BuildContext context) {
    final days = _getCurrentDays(visiblePageDate);
    return Column(
      children: [
        const DaysOfTheWeek(),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              6,
                  (index) {
                return DaysRow(
                  dates: days.getRange(index * 7, (index + 1) * 7).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
