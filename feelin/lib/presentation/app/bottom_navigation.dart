import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/profile/profile_bloc.dart';
import 'package:music_sns/presentation/main/post/app/post_app.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../main/profile/app/profile_app.dart';
import 'tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab, required this.profileKey});

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  //https://stackoverflow.com/questions/51029655/call-method-in-one-stateful-widget-from-another-stateful-widget-flutter
  final GlobalKey<ProfileAppScaffoldState> profileKey;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: ''
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ''
        ),
      ],
      selectedFontSize: 10,
      unselectedFontSize: 10,
      currentIndex: currentTab.index,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: FeelinColorFamily.blueCore,
      backgroundColor: Colors.white,
      unselectedItemColor: FeelinColorFamily.grayscaleGray2,
      onTap: (index) {
        if(index != 1){
          onSelectTab(TabItem.values[index]);
        }else{
          Navigator.push(context, CupertinoPageRoute(
            builder: (context){
              return const PostApp();
            },
          ),
          ).then((value) { if(value != null) onSelectTab(TabItem.profile); profileKey.currentState?.onRefresh();});
        }

      },
    );
  }
}