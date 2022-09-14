import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_dimens.dart';
import 'package:flutter_base/constants/app_style.dart';
import 'package:flutter_base/main.dart';
import 'package:flutter_base/utils/constants.dart';

import '../auto_size_text.dart';

/// Days of the week
final _DaysOfTheWeek = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

/// Show the row of text from [_DaysOfTheWeek]
class DaysOfTheWeek extends StatelessWidget {
  const DaysOfTheWeek();

  Widget defaultLabels(index,BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BorderDirectional(
          start: AppStyle.borderSize(context),
          end: AppStyle.borderSize(context),
        )
      ),
      padding: const EdgeInsets.symmetric(vertical: AppDP.dp_10,horizontal: AppDP.dp_5),
      child: autoTextSize(
        _DaysOfTheWeek[index],
        textStyle: Theme.of(globalKeyMain.currentContext!).textTheme.bodySmall,
        textAlign: TextAlign.start,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        Constants.GENERATE_DATE,
        (index) {
          return Expanded(
            child: defaultLabels(index,context),
          );
        },
      ),
    );
  }
}
