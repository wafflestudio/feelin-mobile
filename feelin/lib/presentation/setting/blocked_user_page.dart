import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/block/blocked_user_bloc.dart';

import 'block_user_item.dart';

class BlockedUserPage extends StatefulWidget {

  const BlockedUserPage({Key? key,}) : super(key: key);

  @override
  State<BlockedUserPage> createState() => _BlockedUserPageState();
}

class _BlockedUserPageState extends State<BlockedUserPage>{

  final ScrollController _scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
    context.read<BlockedUserBloc>().add(const BlockedUserEvent.loadRequest());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockedUserBloc, BlockedUserState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              automaticallyImplyLeading: false,
              leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios_new),),
              title: const Text('Blocked Users',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
            ),
            body: state.users.isEmpty ?
            const Center(child: Text('No user.')) :
            ListView.builder(
              controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: (state.isLoading && !state.isLast)
                    ? state.users.length + 1 : state.users.length,
                itemBuilder: (context, index) {
                  if (index == state.users.length) {
                    if (state.isLoading) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 40),
                        child: CupertinoActivityIndicator(radius: 18,),
                      );
                    } else {
                      return Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: const Center(child: Text(
                          '모든 게시글을 불러왔습니다!',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        )),
                      );
                    }
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, left: 8, right: 8),
                      child: BlockUserItem(index: index, profile: state.users[index]),
                    );
                  }
                }),
          );
        }
    );
  }
}