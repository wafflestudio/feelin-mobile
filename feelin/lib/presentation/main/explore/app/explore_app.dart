import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/main/explore/explore_page.dart';

import '../../../../application/explore/explore_bloc.dart';
import '../../../../application/share/share.dart';
import '../../../../injection.dart';
import '../../../app/my_key_store.dart';
import 'explore_app_bar.dart';
import 'explore_app_bar_bottom.dart';

class ExploreApp extends StatelessWidget {
  final int? userId;

  const ExploreApp({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<ExploreBloc>(),
      child: ExploreAppScaffold(key: MyKeyStore.exploreKey,),
    );
  }
}

class ExploreAppScaffold extends StatefulWidget {

  const ExploreAppScaffold({Key? key,}) : super(key: key);

  @override
  State<ExploreAppScaffold> createState() => ExploreAppScaffoldState();
}

class ExploreAppScaffoldState extends State<ExploreAppScaffold> with TickerProviderStateMixin {

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollControllerF = ScrollController();
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    Share(context: context).initialize();
    _tabController = TabController(length: 2, vsync: this);
  }

  void goToTop(){
    if(!_tabController.indexIsChanging && _tabController.index == 0){
      _scrollControllerF.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }else if(!_tabController.indexIsChanging && _tabController.index == 1){
      _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  void syncLike(String id){
    context.read<ExploreBloc>().add(ExploreEvent.likeSyncRequest(id));
  }

  void syncUnlike(String id){
    context.read<ExploreBloc>().add(ExploreEvent.unlikeSyncRequest(id));
  }

  void removeItemByPostId(String id){
    context.read<ExploreBloc>().add(ExploreEvent.removeItemByPostId(id));
  }

  double tabBarVisible = 1.0;

  void showTabBar(){
    setState(() {
      tabBarVisible = 1.0;
    });
  }

  void hideTabBar(){
    setState(() {
      tabBarVisible = 0.3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: false,
        appBar: ExploreAppBar(
          function: goToTop,),
        body: Scaffold(
          appBar: PreferredSize(preferredSize: AppBar().preferredSize * 0.8,
          child: AnimatedOpacity(opacity: tabBarVisible,
          duration: const Duration(milliseconds: 200),
          child: ExploreAppBarBottom(tabController: _tabController))),
          extendBodyBehindAppBar: true,
          body: ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: TabBarView(
              controller: _tabController,
              physics: const ClampingScrollPhysics(),
              children: [
                ExplorePage(scrollController: _scrollControllerF, isFollowing: true, key: MyKeyStore.explorePageKey, showTabBar: showTabBar, hideTabBar: hideTabBar,),
                ExplorePage(scrollController: _scrollController, isFollowing: false, showTabBar: showTabBar, hideTabBar: hideTabBar,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}