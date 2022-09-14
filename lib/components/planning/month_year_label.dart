import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_widget_model.dart';
import 'package:flutter_base/constants/app_style.dart';
import 'package:flutter_base/utils/extension.dart';

import '../../constants/app_dimens.dart';
import '../../pages/planning_page/controller/calendar_state_controller.dart';
import '../../pages/planning_page/controller/cell_calendar_page_controller.dart';
import '../auto_size_text.dart';

class MonthYearLabel extends BaseWidgetModel<CalendarStateController> {
  final CellCalendarPageController cellCalendarPageController;

  MonthYearLabel(this.cellCalendarPageController);

  @override
  Widget build(BuildContext context, CalendarStateController widgetModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          border: BorderDirectional(
              start: AppStyle.borderSize(context))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              const Icon(
                Icons.arrow_back_ios_sharp,
                size: AppDP.dp_10,
                color: Colors.grey,
              ),
              autoTextSize("Previous",
                  textStyle: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: AppDP.dp_10),
            child: autoTextSize(
              widgetModel.currentDateTime!.getDatetime,
              textStyle: Theme.of(context).textTheme.titleLarge,
            ),
          )),
          Row(
            children: [
              autoTextSize(
                "Next",
                textStyle: Theme.of(context).textTheme.bodySmall,
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: AppDP.dp_11,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}
