import 'package:flutter/material.dart';
import 'package:flutter_base/base/base_widget_model.dart';
import 'package:flutter_base/constants/app_style.dart';
import 'package:flutter_base/pages/planning_page/planning_viewmodel.dart';

import '../../constants/app_color.dart';
import '../../constants/app_dimens.dart';
import '../auto_size_text.dart';

typedef listDropDown = List<String> Function(String? value);

class HeaderPlanning extends BaseWidgetModel<PlanningViewModel> {
  final listDropDown listDropCalendar;
  final listDropDown listDropFilter;
  final Function(String) onChangeSearch;

  late BuildContext context;

  HeaderPlanning(
      {Key? key,
      required this.listDropCalendar,
      required this.listDropFilter,
      required this.onChangeSearch});

  @override
  Widget build(BuildContext context, PlanningViewModel widgetModel) {
    this.context = context;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDP.dp_10),
      decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: AppStyle.borderSize(context))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ..._dropDowItem(
                      "View", listDropCalendar, widgetModel.textDropCalendar)
                  .children,
              const SizedBox(
                width: AppDP.dp_30,
              ),
              ..._dropDowItem("Filter", listDropFilter, widgetModel.textFilter)
                  .children
            ],
          ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(vertical: AppDP.dp_5),
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: SizedBox(
              width: AppDP.dp_200,
              height: AppDP.dp_35,
              child: TextField(
                autofocus: false,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.name,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search,
                      color: AppColor.h00cccc,
                      size: AppDP.dp_15,
                    ),
                    hintText: "Search",
                    fillColor: Colors.white.withAlpha(980),
                    filled: true,
                    enabledBorder: const UnderlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppDP.dp_4)),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: AppDP.dp_0)),
                    focusedBorder: const UnderlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppDP.dp_4)),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: AppDP.dp_0)),
                    border: const UnderlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppDP.dp_4)),
                        borderSide: BorderSide(
                            color: Colors.transparent, width: AppDP.dp_0))),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Row _dropDowItem(String firstText, listDropDown listItem, String? textDrop) =>
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: AppDP.dp_7),
            child: autoTextSize(
              firstText,
              textStyle: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          DropdownButton<String>(
            alignment: Alignment.topRight,
            value: textDrop,
            icon: const Icon(
              Icons.arrow_drop_down,
              size: AppDP.dp_15,
              color: AppColor.h00cccc,
            ),
            items: listItem(null)
                .map((e) => DropdownMenuItem(
                      child: autoTextSize(e,
                          textStyle:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColor.h00cccc,
                                    fontWeight: FontWeight.bold,
                                  )),
                      value: e,
                    ))
                .toList(),
            onChanged: listItem,
            underline: const SizedBox.shrink(),
          )
        ],
      );
}
