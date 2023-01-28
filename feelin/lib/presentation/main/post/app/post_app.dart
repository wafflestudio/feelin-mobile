import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/presentation/main/post/post_detail_page.dart';
import 'package:music_sns/presentation/main/post/post_page.dart';

import '../../../../injection.dart';
import '../post_track_page.dart';
import 'post_app_bar.dart';

class PostApp extends StatelessWidget {
  final int? userId;

  const PostApp({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<PostFormBloc>(),
      child: PostAppScaffold(userId),
    );
  }
}

class PostAppScaffold extends StatefulWidget {
  final int? userId;

  const PostAppScaffold(this.userId, {Key? key}) : super(key: key);

  @override
  State<PostAppScaffold> createState() => _PostAppScaffoldState();
}

class _PostAppScaffoldState extends State<PostAppScaffold> {

  int _currPage = 1;

  void goToNext() => setState(() {
    _currPage++;
  });

  void goToPrevious() => setState(() {
    if(_currPage > 1){
      _currPage--;
    }else{
      // pop
      Navigator.pop(context);
    }
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(_currPage == 1){
          return Future.value(true);
        }else{
          setState(() {
            _currPage --;
          });
          return Future.value(false);
        }
      },
      child: Scaffold(
        //backgroundColor: Colors.white,
        appBar: PostAppBar(goToBack: goToPrevious, goToNext: goToNext, currPage: _currPage,),
        body: Builder(builder: (BuildContext context){
          if(_currPage == 1) return PostPage(goToNext: goToNext);
          if(_currPage == 2) return PostTrackPage(goToNext: goToNext);
          if(_currPage == 3) return const PostDetailPage();
          return Container();
        }),
      ),
    );
  }
}