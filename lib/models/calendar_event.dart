import 'package:flutter/material.dart';

import '../base/base_list/common_data.dart';
import '../constants/app_color.dart';

/// DataModel of event
///
/// [eventName] and [eventDate] is essential to show in [CellCalendar]
class CalendarEvent extends CommonData{
  CalendarEvent({
    required this.eventName,
    required this.eventDate,
    this.eventBackgroundColor = AppColor.hcc0000,
    this.eventID,
  }):super(title: eventName,subTitle: "1 hours",leadingColor: eventBackgroundColor);

  final String eventName;
  final DateTime eventDate;
  final String? eventID;
  final Color eventBackgroundColor;
}
