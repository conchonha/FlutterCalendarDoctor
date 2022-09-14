import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/planning/cell_calendar.dart';
import '../../components/planning/header_planning.dart';
import '../../components/planning/left_planning.dart';
import '../../utils/constants.dart';
import 'controller/calendar_state_controller.dart';
import 'controller/cell_height_controller.dart';
import 'planning_viewmodel.dart';
import 'controller/cell_calendar_page_controller.dart';

class PlanningPage extends StatelessWidget {
  PlanningPage({Key? key}) : super(key: key);

  final CellCalendarPageController _pageController = CellCalendarPageController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CalendarStateController(
            events: sampleEvents(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => CellHeightController(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlanningViewModel(),
        )
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Column(
          children: [
            Consumer<PlanningViewModel>(
              builder: (_,vm,child) => HeaderPlanning(
                listDropCalendar: (valueChange) {
                  // vm.setTextDropCalendar = valueChange;
                  return listDropDow;
                },
                listDropFilter: (valueChange) {
                  // vm.setTextFilter = valueChange;
                  return listFilter;
                },
                onChangeSearch: (value) {},
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Flexible(fit: FlexFit.tight, flex: 2, child: LeftPlanning()),
                Flexible(
                    flex: 8,
                    child: Container(
                      color: Colors.white,
                      child: CellCalendar(
                        cellCalendarPageController: _pageController,
                        events: sampleEvents(),
                      ),
                    ))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
