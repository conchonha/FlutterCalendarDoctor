import 'package:flutter/material.dart';
import 'package:flutter_base/constants/app_color.dart';
import 'package:flutter_base/constants/app_drawable.dart';
import 'package:flutter_base/constants/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef OnNavigationItemSelected(int index);

class SideNavigationItem {
  final String? icon;
  final String? title;
  bool selected;
  SideNavigationItem({this.icon, this.title, this.selected = false});
}

class SideNavigationItemWidget extends StatefulWidget {
  final SideNavigationItem item;
  final int? index;
  final VoidCallback onTap;
  SideNavigationItemWidget({Key? key, required this.item, this.index,required this.onTap})
      : super(key: key);
  @override
  _SideNavigationItemWidgetState createState() =>
      _SideNavigationItemWidgetState();
}

class _SideNavigationItemWidgetState extends State<SideNavigationItemWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.item.selected ? AppColor.h059669 : Colors.transparent),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            widget.item.icon != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: IconButton(
                        onPressed: widget.onTap,
                        icon: SvgPicture.asset(
                          widget.item.icon ?? "",
                          color: widget.item.selected ? Colors.white : null,
                        ),
                        iconSize: 35),
                  )
                : Container(),
            Text(
              widget.item.title ?? "",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: widget.item.selected ? Colors.white : AppColor.h94A3B8,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}

class SideNavigation extends StatefulWidget {
  final List<SideNavigationItem> navItems;
  final OnNavigationItemSelected itemSelected;
  final int initialIndex;
  final List<Widget> actions;
  final Color colors;
  SideNavigation(
      {Key? key,
      required this.navItems,
      required this.itemSelected,
      required this.initialIndex,
      required this.actions,
      required this.colors});
  @override
  _SideNavigationState createState() => _SideNavigationState(
      key: key,
      navItems: this.navItems,
      initializeIndex: this.initialIndex,
      actions: this.actions);
}

class _SideNavigationState extends State<SideNavigation> {
  final List<SideNavigationItem> navItems;
  final List<Widget> actions;
  final int initializeIndex;
  var currentIndex;

  _SideNavigationState(
      {Key? key,
      required this.navItems,
      required this.initializeIndex,
      required this.actions});

  @override
  void initState() {
    super.initState();
    if (navItems.isNotEmpty && initializeIndex <= navItems.length) {
      navItems[initializeIndex].selected = true;
      currentIndex = initializeIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: widget.colors),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.topCenter,
                //height: MediaQuery.of(context).size.height * 0.01,
                margin: const EdgeInsets.only(top: 24),
                // child: SvgPicture.asset(AppDrawable.iconPlayeda)
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              ListView.separated(
                separatorBuilder: (context, index) {
                  return index == 4
                      ? const Divider(
                    color: AppColor.h334155,
                    thickness: 1,
                  )
                      : Container();
                },
                itemBuilder: (context, index) {
                  var item = navItems[index];
                  return GestureDetector(
                    child: SideNavigationItemWidget(
                      onTap: (){
                        setState(() {
                          for (var item in navItems) {
                            item.selected = false;
                          }
                          item.selected = true;
                        });
                        if (index != currentIndex) {
                          widget.itemSelected(index);
                          currentIndex = index;
                        }
                      },
                      item: item,
                      index: index,
                    ),
                    // onTap: () {
                    //   setState(() {
                    //     for (var item in navItems) {
                    //       item.selected = false;
                    //     }
                    //     item.selected = true;
                    //   });
                    //   if (index != currentIndex) {
                    //     widget.itemSelected(index);
                    //     currentIndex = index;
                    //   }
                    // },
                  );
                },
                itemCount: navItems.length,
                shrinkWrap: true,
                primary: false,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "TSP Agency © 2022",
                  textAlign: TextAlign.center,
                  style: AppStyle.textStyleMenu,
                ),
              )
            ],
          ),
        ));
  }
}
