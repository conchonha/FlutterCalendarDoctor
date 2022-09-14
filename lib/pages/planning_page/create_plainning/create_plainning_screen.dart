import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_color.dart';
import 'package:flutter_base/constants/app_dimens.dart';
import 'package:flutter_base/constants/app_drawable.dart';
import 'package:flutter_svg/svg.dart';

import '../../../generated/l10n.dart';

class CreatePlanningScreen extends StatefulWidget {
  const CreatePlanningScreen({Key? key}) : super(key: key);

  @override
  _CreatePlanningScreenState createState() => _CreatePlanningScreenState();
}

class _CreatePlanningScreenState extends State<CreatePlanningScreen> {
  final List<String> exampleOption = [
    'Example 1',
    'Example 2',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppDP.dp_30, top: AppDP.dp_30),
          child: Column(
            children: [
              Row(
                children: [
                  fieldDisplay("Doctor's ( from data )",
                      nameSelected: 'Daniel’s John Doe'),
                  const SizedBox(
                    width: 25,
                  ),
                  fieldDisplay("Play eDA",
                      nameSelected: 'Better, safer, faster dental care'),
                ],
              ),
              const SizedBox(
                height: 34,
              ),
              Row(
                children: [
                  Container(
                      width: AppDP.dp_30,
                      height: AppDP.dp_30,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: AppColor.colorE2E8F0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppDrawable.iconLocation,
                            width: AppDP.dp_15,
                            height: AppDP.dp_18,
                          ),
                        ],
                      )),
                  const SizedBox(
                    width: AppDP.dp_13,
                  ),
                  Text(
                    S.of(context).location,
                    style: const TextStyle(
                        color: AppColor.color_1E293B,
                        fontSize: AppDP.dp_14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: AppDP.dp_17,
              ),
              Row(
                children: [
                  fieldDisplay(S.of(context).country, nameSelected: 'Vietnam'),
                  const SizedBox(
                    width: AppDP.dp_25,
                  ),
                  fieldDisplay(S.of(context).city, nameSelected: 'Ho Chi Minh'),
                  const SizedBox(
                    width: AppDP.dp_25,
                  ),
                  fieldDisplay(S.of(context).district, nameSelected: 'District 1'),
                ],
              ),
              const SizedBox(
                height: AppDP.dp_30,
              ),
              Row(
                children: [
                  fieldDisplay(S.of(context).address,
                      width: AppDP.dp_525,
                      nameSelected: 'Type here',
                      fontStyle: FontStyle.italic),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: AppDP.dp_30,
                    height: AppDP.dp_30,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColor.colorE2E8F0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppDrawable.iconClock,
                          width: AppDP.dp_16,
                          height: AppDP.dp_16,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: AppDP.dp_13,
                  ),
                  Text(
                    S.of(context).time,
                    style: const TextStyle(
                        color: AppColor.color_1E293B,
                        fontSize: AppDP.dp_14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: AppDP.dp_17,
              ),
              Row(
                children: [
                  fieldDisplay(S.of(context).from,
                      width: AppDP.dp_150, nameSelected: '12:00 AM'),
                  const SizedBox(
                    width: AppDP.dp_25,
                  ),
                  fieldDisplay(S.of(context).to,
                      width: AppDP.dp_150, nameSelected: '02:00 PM'),
                  const SizedBox(
                    width: AppDP.dp_25,
                  ),
                  fieldDisplay(S.of(context).notification,
                      width: AppDP.dp_150, nameSelected: 'per 3 minutes'),
                ],
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        Container(
          color: Colors.white,
          width: double.infinity,
          height: AppDP.dp_80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: AppDP.dp_110,
                height: AppDP.dp_44,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 1.0, color: AppColor.color94A3B8),
                  ),
                  child:  Text(
                    S.of(context).cancel,
                    style: const TextStyle(
                        color: AppColor.color94A3B8, fontSize: AppDP.dp_14),
                  ),
                ),
              ),
              const SizedBox(
                width: AppDP.dp_30,
              ),
              Container(
                width: AppDP.dp_200,
                height: AppDP.dp_44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.color1D4ED8,
                ),
                child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(AppDrawable.iconCreate),
                        Text(
                          S.of(context).createNewPlanning,
                          style: const TextStyle(
                              fontSize: AppDP.dp_14,
                              color: AppColor.colorF8FAFC),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                width: AppDP.dp_30,
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget fieldDisplay(String title,
      {double width = 250, String nameSelected = '', FontStyle? fontStyle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          style: const TextStyle(color: AppColor.color_1E293B),
        ),
        const SizedBox(
          height: AppDP.dp_4,
        ),
        SizedBox(
          height: 44,
          width: width,
          child: DropdownButtonFormField2(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide:
                    const BorderSide(color: AppColor.colorCBD5E1, width: 1),
              ),
            ),
            isExpanded: true,
            hint: Text(
              nameSelected,
              style: TextStyle(fontSize: 14, fontStyle: fontStyle),
            ),
            icon: SvgPicture.asset(AppDrawable.iconDropdown),
            iconSize: 30,
            buttonHeight: 44,
            buttonPadding: const EdgeInsets.only(left: 16, right: 16),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            items: exampleOption
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select example.';
              }
            },
            onChanged: (value) {
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
          ),
        )
      ],
    );
  }
}
