import 'package:flutter/material.dart';
import 'package:music_sns/presentation/main/explore/app/explore_app.dart';

import '../main/profile/app/profile_app.dart';
import 'my_key_store.dart';
import 'tab_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  const TabNavigator({Key? key, required this.navigatorKey, required this.tabItem,}) : super(key: key);
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;
  //https://stackoverflow.com/questions/51029655/call-method-in-one-stateful-widget-from-another-stateful-widget-flutter

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    switch(tabItem){
      case TabItem.home: return {TabNavigatorRoutes.root: (context) => const ExploreApp()};
      case TabItem.post: return {TabNavigatorRoutes.root: (context) => const SizedBox()};
      case TabItem.profile: return {TabNavigatorRoutes.root: (context) => ProfileApp(profileKey: MyKeyStore.profileKey)};
      default: return {TabNavigatorRoutes.root: (context) => const ExploreApp()};
    }
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}