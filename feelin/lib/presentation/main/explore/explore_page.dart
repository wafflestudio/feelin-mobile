import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/explore/explore_bloc.dart';
import 'package:music_sns/presentation/style/colors.dart';

import 'explore_list.dart';

class ExplorePage extends StatefulWidget{
  final ScrollController scrollController;
  final bool isFollowing;
  const ExplorePage({Key? key, required this.scrollController, required this.isFollowing}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}
class _ExplorePageState extends State<ExplorePage>{
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  void _firstLoad() async {
    setState((){
      _isFirstLoadRunning = true;
    });
    try {
      if(widget.isFollowing){
        context.read<ExploreBloc>().add(const ExploreEvent.resetFRequest());
        context.read<ExploreBloc>().add(const ExploreEvent.loadFRequest());
      }else{
        context.read<ExploreBloc>().add(const ExploreEvent.resetRequest());
        context.read<ExploreBloc>().add(const ExploreEvent.loadRequest());
      }

    } catch (err) {
      print('알 수 없는 오류가 발생했습니다.');
    }
    setState(() => _isFirstLoadRunning = false);
  }

  void _loadMore() async {
    if (_isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        widget.scrollController.position.extentAfter < 300) {
      setState(() => _isLoadMoreRunning = true);
      try {
        if(widget.isFollowing){
          context.read<ExploreBloc>().add(const ExploreEvent.loadFRequest());
        }else{
          context.read<ExploreBloc>().add(const ExploreEvent.loadFRequest());
        }
      } catch (err) {
        print('알 수 없는 오류가 발생했습니다.');
      }
      setState(() => _isLoadMoreRunning = false);
    }
  }

  @override
  void initState() {
    _firstLoad();
    widget.scrollController.addListener(_loadMore);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return _isFirstLoadRunning
      ? const Center(
        child: CupertinoActivityIndicator(radius: 18,)
    )
    : BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        return RefreshIndicator(
            onRefresh: () async => _firstLoad(),
            color: FeelinColorFamily.blueCore,
            child: widget.isFollowing
                ? ExploreList(isLast: state.isLastF, feeds: state.feedsF, isLoading: state.isLoadingF, scrollController: widget.scrollController)
                : ExploreList(isLast: state.isLast, feeds: state.feeds, isLoading: state.isLoading, scrollController: widget.scrollController)
          ,
        );
      }
    )
    ;
  }
}