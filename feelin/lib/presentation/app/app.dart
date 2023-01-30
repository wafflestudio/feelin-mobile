import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/share/share.dart';
import '../../application/streaming/streaming_bloc.dart';
import '../main/profile/app/profile_app.dart';
import 'bottom_navigation.dart';
import 'tab_item.dart';
import 'tab_navigator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App>{
  var _currentTab = TabItem.home;
  final _navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.post: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  //https://stackoverflow.com/questions/51029655/call-method-in-one-stateful-widget-from-another-stateful-widget-flutter
  final GlobalKey<ProfileAppScaffoldState> _profileKey = MyKeyStore.profileKey;

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
        _currentTab = TabItem.home;
      });
    });
    context.read<StreamingBloc>().add(const StreamingEvent.getMyAccount());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !_navigatorKeys[_currentTab]!.currentState!.canPop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.home) {
            // select 'main' tab
            _selectTab(TabItem.home);
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
          _buildOffstageNavigator(TabItem.home),
          _buildOffstageNavigator(TabItem.post),
          _buildOffstageNavigator(TabItem.profile),
        ]),
        bottomNavigationBar: SingleChildScrollView(
          child: BottomNavigation(
            currentTab: _currentTab,
            onSelectTab: _selectTab,
            profileKey: _profileKey,
          ),
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
      ),
    );
  }
}