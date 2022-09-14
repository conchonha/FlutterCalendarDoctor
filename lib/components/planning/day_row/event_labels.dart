import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_base/utils/constants.dart';
import 'package:flutter_base/utils/extension.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_dimens.dart';
import '../../../models/calendar_event.dart';
import '../../../pages/planning_page/controller/calendar_state_controller.dart';
import '../../../pages/planning_page/controller/cell_height_controller.dart';
import '../../auto_size_text.dart';

/// Numbers to return accurate events in the cell.
const maxHeightItemEvent = AppDP.MAX_HEIGHT_ITEM_EVENT_DATE;

/// Get events to be shown from [CalendarStateController]
///
/// Shows accurate number of [_EventLabel] by the height of the parent cell
/// notified from [CellHeightController]
class EventLabels extends StatelessWidget {
  EventLabels(this.date);

  bool checkMaxItem = false;
  final DateTime date;
  int maxItem = 0;
  CellHeightController? _provide;

  List<CalendarEvent> _eventsOnTheDay(
      DateTime date, List<CalendarEvent> events) {
    final res = events
        .where((event) =>
            event.eventDate.year == date.year &&
            event.eventDate.month == date.month &&
            event.eventDate.day == date.day)
        .toList();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    _provide = Provider.of<CellHeightController>(context, listen: true);
    return Selector<CalendarStateController, List<CalendarEvent>>(
      builder: (context, events, _) {
        final eventsOnTheDay = _eventsOnTheDay(date, events);
        return Column(
          children: [
            _DayLabel(
              date: date,
            ),
            const SizedBox(
              height: AppDP.dp_2,
            ),
            ..._listEvent(eventsOnTheDay)
          ],
        );
      },
      selector: (context, controller) => controller.events,
    );
  }

  List<Widget> _listEvent(List<CalendarEvent> list) =>
      List.generate(_getLength(list), (index) {
        if (checkMaxItem && (index == maxItem - Constants.ONE)) {
          return const SizedBox(
            height: AppDP.dp_13,
            child: Center(
              child: Icon(
                Icons.more_horiz,
                size: AppSP.sp_13,
              ),
            ),
          );
        }
        return _eventLabel(list[index]);
      });

   _getLength(List<CalendarEvent> list) {
     maxItem = (_provide!.cellHeight! / maxHeightItemEvent).floor() - Constants.ONE;
    if(list.length > maxItem){
      checkMaxItem = true;
      return maxItem;
    }
    return list.length;
  }

  /// label to show [CalendarEvent]
  Widget _eventLabel(CalendarEvent event) {
    return SizedBox(
        height: maxHeightItemEvent,
        width: double.infinity,
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.only(
              bottom: AppDP.dp_1, left: AppDP.dp_4, right: AppDP.dp_4),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(AppDP.dp_6),
              ),
              color: AppColor.he0e0eb),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(left: AppDP.dp_5),
                alignment: Alignment.centerLeft,
                width: AppDP.dp_5,
                height: AppDP.dp_5,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: event.eventBackgroundColor),
              ),
              Expanded(
                  child: autoTextSize(event.eventName,
                      textStyle: TextStyle(
                          fontSize: AppSP.sp_11,
                          color: Colors.grey.checkDateTime(date,
                              color: AppColor.h00cccc, alpha: 0.7))))
            ],
          ),
        ));
  }
}

class _DayLabel extends StatelessWidget {
  _DayLabel({
    Key? key,
    required this.date,
  }) : super(key: key);

  final DateTime date;
  final today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final isCurrentDate = date.month == today.month &&
        date.day == today.day &&
        date.year == today.year;
    return Container(
      height: maxHeightItemEvent,
      alignment: Alignment.topLeft,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppDP.dp_4),
      child: autoTextSize(
          textAlign: TextAlign.start,
          date.day.toString(),
          textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isCurrentDate ? AppColor.h00cccc : Colors.grey,
              fontWeight: isCurrentDate ? FontWeight.bold : FontWeight.w400)),
    );
  }
}
