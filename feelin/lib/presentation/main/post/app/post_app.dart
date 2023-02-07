import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/application/post/post_form/post_form_bloc.dart';
import 'package:music_sns/presentation/main/post/post_page.dart';

import '../../../../injection.dart';
import 'post_app_bar.dart';

class PostApp extends StatelessWidget {
  final int globalContext;

  const PostApp({Key? key, required this.globalContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<PostFormBloc>(),
      child: PostAppScaffold(globalContext: globalContext,),
    );
  }
}

class PostAppScaffold extends StatefulWidget {
  final int globalContext;
  const PostAppScaffold({Key? key, required this.globalContext}) : super(key: key);

  @override
  State<PostAppScaffold> createState() => _PostAppScaffoldState();
}

class _PostAppScaffoldState extends State<PostAppScaffold> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PostAppBar(currPage: 1, goToNext: (){},),
      body: PostPage(globalContext: widget.globalContext),
    );
  }
}