import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_bar_item.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.profile, 2));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.explore:
        emit(NavigationState(NavbarItem.explore, 0));
        break;
      case NavbarItem.post:
        emit(NavigationState(NavbarItem.post, 1));
        break;
      case NavbarItem.profile:
        emit(NavigationState(NavbarItem.profile, 2));
        break;
    }
  }
}