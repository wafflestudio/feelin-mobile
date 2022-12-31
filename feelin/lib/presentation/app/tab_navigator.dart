import 'package:flutter/material.dart';
import 'package:music_sns/presentation/main/explore/app/explore_app.dart';
import 'package:music_sns/presentation/main/explore/explore_page.dart';
import 'package:music_sns/presentation/main/post/app/post_app.dart';
import 'package:music_sns/presentation/main/post/post_page.dart';

import '../main/profile/app/profile_app.dart';
import 'tab_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    switch(tabItem){
      // TODO: Page -> App
      case TabItem.explore: return {TabNavigatorRoutes.root: (context) => ExploreApp()};
      case TabItem.post: return {TabNavigatorRoutes.root: (context) => PostApp()};
      case TabItem.profile: return {TabNavigatorRoutes.root: (context) => ProfileApp()};
      default: return {TabNavigatorRoutes.root: (context) => ExploreApp()};
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