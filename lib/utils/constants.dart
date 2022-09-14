import '../constants/app_color.dart';
import '../models/calendar_event.dart';

class Constants {
  static const ZERO = 0;
  static const GENERATE_DATE = 7;
  static const ONE = 1;
  static const UPCOMMING_TYPE = 0;
  static const DOCTOR_TYPE = 1;
}

final listDropDow = ["Calendar", "Calendar1", "Calendar2", "Calendar3"];
final listFilter = [
  "Month",
  "Year",
  "Day"
];

List<CalendarEvent> sampleEvents() {
  final today = DateTime.now();
  final sampleEvents = [
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: -30)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "3333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "33333",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today,
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: 3)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "33333",
        eventDate: today.add(Duration(days: 7)),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "SangTBh",
        eventDate: today.add(Duration(days: 13)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(
          Duration(days: 13),
        ),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: 13)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: 13)),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: 21)),
        eventBackgroundColor: AppColor.hcc0000),
    CalendarEvent(
        eventName: "SangTBp",
        eventDate: today.add(
          Duration(days: 30),
        ),
        eventBackgroundColor: AppColor.h00cccc),
    CalendarEvent(
        eventName: "SangTB",
        eventDate: today.add(Duration(days: 42)),
        eventBackgroundColor: AppColor.hcc0000),
  ];
  return sampleEvents;
}
