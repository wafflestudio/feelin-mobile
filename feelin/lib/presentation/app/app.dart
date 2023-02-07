import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../application/share/share.dart';
import '../../application/streaming/streaming_bloc.dart';
import '../main/profile/app/profile_app.dart';
import '../style/colors.dart';
import 'bottom_navigation.dart';
import 'my_key_store.dart';
import 'tab_item.dart';
import 'tab_navigator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App>{
  var _currentTab = TabItem.home;
  final navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.post: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  //https://stackoverflow.com/questions/51029655/call-method-in-one-stateful-widget-from-another-stateful-widget-flutter
  final GlobalKey<ProfileAppScaffoldState> _profileKey = MyKeyStore.profileKey;

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      if(!navigatorKeys[tabItem]!.currentState!.canPop()){
        if(tabItem == TabItem.profile){
          MyKeyStore.profileKey.currentState?.goToTop();
        }else if(tabItem == TabItem.home){
          MyKeyStore.exploreKey.currentState?.goToTop();
        }
      }
      // 현재 탭 버튼 두 번 누르면 해당 탭의 처음 루트로 복귀
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
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

  bool isVisibleBottom = true;

  void showBottomNavi(){
    setState(() {
      isVisibleBottom = true;
    });
  }

  void hideBottomNavi(){
    setState(() {
      isVisibleBottom = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !navigatorKeys[_currentTab]!.currentState!.canPop();
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
          navigatorKeys[_currentTab]!.currentState!.maybePop();
          return false;
        }
      },
      child: BlocListener<StreamingBloc, StreamingState>(
        listener: (context, state){
          state.saveFailureOrSuccessOption.fold(
                () => null,
                (failureOrSuccess) {failureOrSuccess.fold(
                  (f) => showTopSnackBar(
                Overlay.of(context),
                CustomSnackBar.error(
                  backgroundColor: FeelinColorFamily.errorPrimary,
                  icon: const Icon(Icons.music_note_rounded, color: Colors.transparent,),
                  message:
                  'Failed to save "$f". Please try again',
                ),
              ),
                  (title) async {
                showTopSnackBar(
                  Overlay.of(context),
                  CustomSnackBar.success(
                    icon: const Icon(Icons.music_note_rounded, color: Colors.transparent,),
                    message:
                    'Saved “$title” to your account.',
                  ),
                );
              },
            );
            context.read<StreamingBloc>().add(const StreamingEvent.resetState());
            },
          );
        },
        child: Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator(TabItem.home),
            _buildOffstageNavigator(TabItem.post),
            _buildOffstageNavigator(TabItem.profile),
          ]),
          bottomNavigationBar: SingleChildScrollView(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 1),
              child: SizedBox(
                height: isVisibleBottom ? null : 0.0,
                child: BottomNavigation(
                  currentTab: _currentTab,
                  onSelectTab: _selectTab,
                  profileKey: _profileKey,
                  navigatorKeys: navigatorKeys,
                ),
              ) ,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}