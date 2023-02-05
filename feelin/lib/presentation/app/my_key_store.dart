import 'package:flutter/material.dart';

import '../main/explore/app/explore_app.dart';
import '../main/explore/explore_page.dart';
import '../main/profile/app/profile_app.dart';
import 'app.dart';

class MyKeyStore{
  static GlobalKey<ExploreAppScaffoldState> exploreKey = GlobalKey();
  static GlobalKey<ExplorePageState> explorePageKey = GlobalKey();
  static GlobalKey<ProfileAppScaffoldState> profileKey = GlobalKey();
  static GlobalKey<AppState> appKey = GlobalKey();
}