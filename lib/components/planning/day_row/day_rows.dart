import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_widget_model.dart';
import 'package:flutter_base/utils/extension.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_dimens.dart';
import '../../../pages/planning_page/controller/calendar_state_controller.dart';
import '../../../pages/planning_page/controller/cell_height_controller.dart';
import 'event_labels.dart';
import 'measure_size.dart';

class DaysRow extends BaseWidgetModel<CalendarStateController> {
  DaysRow({
    required this.dates,
    Key? key,
  });

  final List<DateTime> dates;

  @override
  Widget build(BuildContext context, CalendarStateController widgetModel) {
    return Expanded(
      child: Row(
        children: dates.map((date) {
          return Expanded(
              child: GestureDetector(
            onTap: () {
              widgetModel.onCellTapped(date);
            },
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.grey.checkDateTime(date, color: Colors.white),
                border: BorderDirectional(
                  start: _borderSize(context, widgetModel.currentDateTime!, date),
                  end: _borderSize(context, widgetModel.currentDateTime!, date),
                  top: _checkDate(widgetModel.currentDateTime!, date)
                      ? _borderSize(context, widgetModel.currentDateTime!, date)
                      : BorderSide.none,
                  bottom: _borderSize(context, widgetModel.currentDateTime!, date),
                ),
              ),
              child: MeasureSize(
                onChange: (size) {
                  if (size == null) return;
                  Provider.of<CellHeightController>(context, listen: false)
                      .onChanged(size);
                },
                child: Column(
                  children: [Expanded(child: EventLabels(date))],
                ),
              ),
            ),
          ));
        }).toList(),
      ),
    );
  }

  bool _checkDate(DateTime? current, DateTime date) =>
      date.day == current?.day &&
      date.month == current?.month &&
      date.year == current?.year;

  BorderSide _borderSize(
          BuildContext context, DateTime currentDateTime, DateTime date) =>
      BorderSide(
          color: _checkDate(currentDateTime, date)
              ? AppColor.h00cccc
              : Theme.of(context).dividerColor,
          width: AppDP.dp_0_7);
}
