import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/explore/explore_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';

import 'explore_list.dart';

class ExplorePage extends StatefulWidget{
  final ScrollController scrollController;
  final bool isFollowing;
  final Function showTabBar;
  final Function hideTabBar;
  const ExplorePage({Key? key, required this.scrollController, required this.isFollowing, required this.showTabBar, required this.hideTabBar}) : super(key: key);

  @override
  State<ExplorePage> createState() => ExplorePageState();
}
class ExplorePageState extends State<ExplorePage> with AutomaticKeepAliveClientMixin<ExplorePage>{
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  bool isEmpty = false;

  @override
  bool get wantKeepAlive {
    return true;
  }

  void firstLoad() {
    setState((){
      _isFirstLoadRunning = true;
    });
    if(widget.isFollowing){
      context.read<ExploreBloc>().add(const ExploreEvent.resetFRequest());
      context.read<ExploreBloc>().add(const ExploreEvent.loadFRequest());
    }else{
      context.read<ExploreBloc>().add(const ExploreEvent.resetRequest());
      context.read<ExploreBloc>().add(const ExploreEvent.loadRequest());
    }
    setState(() => _isFirstLoadRunning = false);
  }

  void _loadMore() async {
    if (_isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        widget.scrollController.position.extentAfter < 300) {
      setState(() => _isLoadMoreRunning = true);
      if(widget.isFollowing){
        context.read<ExploreBloc>().add(const ExploreEvent.loadFRequest());
      }else{
        context.read<ExploreBloc>().add(const ExploreEvent.loadRequest());
      }
      setState(() => _isLoadMoreRunning = false);
    }
  }

  void removeItemsByUserId(String id) {
    context.read<ExploreBloc>().add(ExploreEvent.removeItemsByUserId(id));
  }

  @override
  void initState() {
    super.initState();
    firstLoad();
    widget.scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    super.build(context);
    isEmpty = context.watch<ExploreBloc>().state.feedsF.isEmpty;
    return _isFirstLoadRunning
      ? const Center(
        child: CupertinoActivityIndicator(radius: 18,)
    )
    : BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification) {
              widget.hideTabBar();
            } else if (scrollNotification is ScrollUpdateNotification) {
              if(widget.scrollController.position.outOfRange || !widget.scrollController.position.activity!.isScrolling || widget.scrollController.position.activity!.velocity < 100 && widget.scrollController.position.activity!.velocity > -100){
                widget.showTabBar();
              }else{
                widget.hideTabBar();
              }
            } else if (scrollNotification is ScrollEndNotification) {
              widget.showTabBar();
            }

            return true;
          },
          child: RefreshIndicator(
              onRefresh: () {
                firstLoad();
                return Future.delayed(const Duration(milliseconds: 400), ()=>Future<void>.value());
                },
              color: FeelinColorFamily.red500,
              child: widget.isFollowing
                  ? ExploreList(isLast: state.isLastF, feeds: state.feedsF, isLoading: state.isLoadingF, scrollController: widget.scrollController, isFollowing: widget.isFollowing, showTabBar: widget.showTabBar, hideTabBar: widget.hideTabBar,)
                  : ExploreList(isLast: state.isLast, feeds: state.feeds, isLoading: state.isLoading, scrollController: widget.scrollController, isFollowing: widget.isFollowing, showTabBar: widget.showTabBar, hideTabBar: widget.hideTabBar,)
            ,
          ),
        );
      }
    )
    ;
  }
}