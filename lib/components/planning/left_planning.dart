import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_list/common_list.dart';
import 'package:flutter_base/base/base_widget_model.dart';
import 'package:flutter_base/constants/app_drawable.dart';
import 'package:flutter_base/main.dart';
import 'package:flutter_base/models/doctor.dart';
import 'package:flutter_base/pages/planning_page/planning_viewmodel.dart';
import 'package:flutter_base/utils/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../constants/app_color.dart';
import '../../constants/app_dimens.dart';
import '../../models/calendar_event.dart';
import '../../pages/planning_page/controller/calendar_state_controller.dart';
import '../auto_size_text.dart';

class LeftPlanning extends BaseWidgetModel<CalendarStateController> {
  late BuildContext _context;

  @override
  Widget build(BuildContext context, CalendarStateController widgetModel) {
    _context = context;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDP.dp_10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _button(onTap: () {
            /// todo something
          }),
          _titleOfList(Constants.UPCOMMING_TYPE),
          _titleOfList(Constants.DOCTOR_TYPE),
        ],
      ),
    );
  }

  Flexible _titleOfList(int type) {
    final checkType = type == Constants.UPCOMMING_TYPE;
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppDP.dp_10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                autoTextSize(checkType ? "Upcoming event" : "Doctor name",
                    textAlign: TextAlign.start,
                    textStyle: Theme.of(_context).textTheme.bodySmall),
                if (!checkType)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: AppDP.dp_10),
                    width: AppDP.dp_5,
                    height: AppDP.dp_5,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.h00cccc),
                  ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  height: AppDP.dp_1,
                  color: Theme.of(globalKeyMain.currentContext!).dividerColor,
                )),
                checkType
                    ? const Icon(Icons.calendar_month_sharp,color: AppColor.h00cccc,size: AppDP.dp_15,)
                    : SvgPicture.asset(
                        AppDrawable.iconDrown,
                        color: AppColor.h00cccc,
                        width: AppDP.dp_15,
                        height: AppDP.dp_15,
                      ),
              ],
            ),
          ),
          Flexible(
            child: Consumer<PlanningViewModel>(
                builder: (context, vm, child) =>
                    checkType ? _listUpComing(vm) : _listDoctor(vm)),
          ),
          if (checkType) _note
        ],
      ),
    );
  }

  Padding _listDoctor(PlanningViewModel vm) => Padding(
        padding: const EdgeInsets.only(top: AppDP.dp_10),
        child: ListView(
          shrinkWrap: true,
          children: vm.listDoctor
              .map((e) => CommonListItem<Doctor>(
                  commonData: e, iAction: vm.eventDoctor))
              .toList(),
        ),
      );

  Container _listUpComing(PlanningViewModel viewModel) => Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: AppDP.dp_20),
        padding: const EdgeInsets.symmetric(
            horizontal: AppDP.dp_5, vertical: AppDP.dp_15),
        child: Consumer<CalendarStateController>(
          builder: (context, controller, child) => ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: controller
                .eventsOnTheDay(controller.currentDateTime!)
                .map((e) => CommonListItem<CalendarEvent>(
                    commonData: e, iAction: viewModel.eventUpComing))
                .toList(),
          ),
        ),
      );

  Widget get _note => Container(
        padding: const EdgeInsets.only(top: AppDP.dp_20, bottom: AppDP.dp_10),
        child: Consumer<PlanningViewModel>(
          builder: (context, vm, _) => Row(
            children: [
              Container(
                  width: AppDP.dp_4,
                  height: AppDP.dp_4,
                  margin: const EdgeInsets.symmetric(horizontal: AppDP.dp_4),
                  child: Transform.scale(
                      scale: 0.6,
                      child: Checkbox(
                          value: vm.changeNote,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: vm.onCheckedNoteChange))),
              autoTextSize(" Note",
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColor.h00cccc)),
              Container(
                width: AppDP.dp_5,
                height: AppDP.dp_5,
                margin: const EdgeInsets.only(left: AppDP.dp_5),
                decoration: const BoxDecoration(
                    color: AppColor.hcc0000, shape: BoxShape.circle),
              )
            ],
          ),
        ),
      );

  Widget _button({required Function() onTap}) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: AppDP.dp_35,
          margin: const EdgeInsets.symmetric(vertical: AppDP.dp_10),
          decoration: const BoxDecoration(
              color: AppColor.h00cccc,
              borderRadius: BorderRadius.all(Radius.circular(AppDP.dp_4))),
          child: Center(
            child: autoTextSize(
              "CREATE",
              textStyle: Theme.of(_context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      );
}
