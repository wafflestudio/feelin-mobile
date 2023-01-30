import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/presentation/main/post/app/post_app.dart';

import '../main/profile/app/profile_app.dart';
import 'tab_item.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key, required this.currentTab, required this.onSelectTab, required this.profileKey}) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  //https://stackoverflow.com/questions/51029655/call-method-in-one-stateful-widget-from-another-stateful-widget-flutter
  final GlobalKey<ProfileAppScaffoldState> profileKey;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int previousIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            icon: widget.currentTab.index == 0 ? SvgPicture.asset('assets/icons/home_filled.svg', color: Colors.black,) : SvgPicture.asset('assets/icons/home.svg', color: Colors.black,),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/plus.svg', color: Colors.black,),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: widget.currentTab.index == 0 ? SvgPicture.asset('assets/icons/profile_filled.svg', color: Colors.black,) : SvgPicture.asset('assets/icons/profile.svg', color: Colors.black,),
            label: ''
        ),
      ],
      selectedFontSize: 10,
      unselectedFontSize: 10,
      currentIndex: widget.currentTab.index,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        if(index != 1){
          widget.onSelectTab(TabItem.values[index]);
          setState(() {
            previousIndex = index;
          });
        }else{
          Navigator.push(context, CupertinoPageRoute(
            builder: (context){
              return PostApp(globalContext: previousIndex,);
            },
          ),
          ).then((value) { if(value != null) {widget.profileKey.currentState?.onRefresh();}});
        }

      },
    );
  }
}