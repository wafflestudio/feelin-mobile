import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/main/explore/explore_page.dart';

import '../../../../application/explore/explore_bloc.dart';
import '../../../../application/share/share.dart';
import '../../../../injection.dart';
import 'explore_app_bar.dart';
import 'explore_app_bar_bottom.dart';

class ExploreApp extends StatelessWidget {
  final int? userId;

  const ExploreApp({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<ExploreBloc>(),
      child: const ExploreAppScaffold(),
    );
  }
}

class ExploreAppScaffold extends StatefulWidget {

  const ExploreAppScaffold({Key? key}) : super(key: key);

  @override
  State<ExploreAppScaffold> createState() => _ExploreAppScaffoldState();
}

class _ExploreAppScaffoldState extends State<ExploreAppScaffold> with TickerProviderStateMixin {

  final ScrollController _scrollController = ScrollController();
  final ScrollController _scrollControllerF = ScrollController();
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    Share(context: context).initialize();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: ExploreAppBar(
          function: (){
          if(!_tabController.indexIsChanging && _tabController.index == 0){
            _scrollControllerF.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
          }else if(!_tabController.indexIsChanging && _tabController.index == 1){
            _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.linear);
          }
        },),
        body: Scaffold(
          appBar: ExploreAppBarBottom(tabController: _tabController),
          extendBodyBehindAppBar: false,
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ExplorePage(scrollController: _scrollControllerF, isFollowing: true,),
              ExplorePage(scrollController: _scrollController, isFollowing: false,),
            ],
          ),
        ),
      ),
    );
  }
}