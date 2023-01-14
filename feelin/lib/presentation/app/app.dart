import 'package:flutter/material.dart';

import '../../application/share/share.dart';
import '../main/profile/app/profile_app.dart';
import 'bottom_navigation.dart';
import 'tab_item.dart';
import 'tab_navigator.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App>{
  var _currentTab = TabItem.profile;
  final _navigatorKeys = {
    TabItem.explore: GlobalKey<NavigatorState>(),
    TabItem.post: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  //https://stackoverflow.com/questions/51029655/call-method-in-one-stateful-widget-from-another-stateful-widget-flutter
  final GlobalKey<ProfileAppScaffoldState> _profileKey = GlobalKey();

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // 현재 탭 버튼 두 번 누르면 해당 탭의 처음 루트로 복귀
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }

  @override
  void initState(){
    super.initState();
    Share(context: context).addListener((){
      setState(() {
        _currentTab = TabItem.explore;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !_navigatorKeys[_currentTab]!.currentState!.canPop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.profile) {
            // select 'main' tab
            _selectTab(TabItem.profile);
            // back button handled by app
            return false;
          }
          return true;
        }else {
          _navigatorKeys[_currentTab]!.currentState!.maybePop();
          return false;
        }
      },
      child: Scaffold(
        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.explore),
          _buildOffstageNavigator(TabItem.post),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
          profileKey: _profileKey,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
        profileKey: _profileKey,
      ),
    );
  }
}