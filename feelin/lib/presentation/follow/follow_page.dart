import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/follow/follow_bloc.dart';
import 'package:music_sns/presentation/follow/follow_app_bar.dart';

import 'follow_list.dart';

class FollowPage extends StatefulWidget {

  final bool isFollowerPage;
  final bool isLikesPage;
  final String id;

  const FollowPage({Key? key, required this.id, required this.isFollowerPage, this.isLikesPage = false}) : super(key: key);

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage>{

  final ScrollController _scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
    if(widget.isLikesPage){
      context.read<FollowBloc>().add(FollowEvent.loadLikesRequest(widget.id));
    }else{
      if(widget.isFollowerPage){
        context.read<FollowBloc>().add(FollowEvent.loadFollowersRequest(widget.id));
      }else{
        context.read<FollowBloc>().add(FollowEvent.loadFollowingsRequest(widget.id));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FollowBloc, FollowState>(
      builder: (context, state) {
        return Scaffold(
          appBar: FollowAppBar(isFollowerPage: widget.isFollowerPage, isLikesPage: widget.isLikesPage,),
          body: FollowList(isLast: state.isLast, users: state.users, isLoading: state.isLoading, scrollController: _scrollController),
        );
      }
    );
  }
}