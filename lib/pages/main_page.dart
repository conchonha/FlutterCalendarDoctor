import 'package:flutter_base/components/vertical_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_color.dart';
import 'package:flutter_base/constants/app_drawable.dart';
import 'package:flutter_base/pages/doctor_page/doctor_page.dart';
import 'package:flutter_base/pages/email_page/email_page.dart';
import 'package:flutter_base/pages/library_page/library_page.dart';
import 'package:flutter_base/pages/planning_page/planning_page.dart';
import 'package:flutter_base/pages/playeda_page/playeda_page.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
    final pageController = PageController(
      initialPage: 0,
      keepPage: true
  );
  int initialTab = 0;
  bool isShow = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SliderDrawer(
            appBar: SliderAppBar(
              title: Container(),
                appBarColor: Colors.white,
              drawerIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child:
                IconButton(icon: const Icon(Icons.menu), onPressed: () {
                  if(!isShow){
                    _key.currentState!.openSlider();
                    isShow = !isShow;
                  } else {
                    isShow = !isShow;
                    _key.currentState!.closeSlider();
                  }
                },),
              )
            ),
            splashColor: Colors.blueAccent,
            key: _key,
            slider:  SideNavigation(
              colors: AppColor.h06102B,
              navItems: [
                SideNavigationItem(icon: AppDrawable.iconPlayeda, title: "Play eDA"),
                SideNavigationItem(icon: AppDrawable.iconLibrary, title: "Library"),
                SideNavigationItem(icon: AppDrawable.iconPlanning, title: "Planning"),
                SideNavigationItem(icon: AppDrawable.iconData, title: "Data"),
                SideNavigationItem(icon: AppDrawable.iconEmail, title: "Email"),
                SideNavigationItem(icon: AppDrawable.iconAccount, title: "Account Setting"),
                SideNavigationItem(icon: AppDrawable.iconLogout, title: "Logout"),
              ],
              itemSelected: (index){
                pageController.jumpToPage(index);
              },
              initialIndex: 0,
              actions: const <Widget>[],
            ),
            child: PageView.builder(
                itemCount: 7,
                controller: pageController,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                   return tabScreen(index);
                },
              )),
      ),
    );
  }

   tabScreen(int index) {
    switch (index) {
      case 0:
      // do something
      return const PlayedaPage();
        break;
      case 1:
      // do something else
        return const LibraryPage();
        break;
      case 2:
      // do something
        return PlanningPage();
        break;
      case 3:
      // do something
        return DoctorPage();
        break;
      case 4:
      // do something
        return const EmailPage();
        break;
      case 5:
      // do something
        return Container();
        break;
      case 6:
      // do something
        return Container();
        break;
    }
  }
}



