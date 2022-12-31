import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/main/explore/explore_page.dart';

import '../../../../application/explore/explore_bloc.dart';
import '../../../../injection.dart';
import 'explore_app_bar.dart';

class ExploreApp extends StatelessWidget {
  final int? userId;

  ExploreApp({Key? key, this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(create: (context) => getIt<ExploreBloc>(),
      child: ProfileAppScaffold(userId),
    );
  }
}

class ProfileAppScaffold extends StatefulWidget {
  final int? userId;

  ProfileAppScaffold(this.userId, {Key? key}) : super(key: key);

  @override
  State<ProfileAppScaffold> createState() => _ProfileAppScaffoldState();
}

class _ProfileAppScaffoldState extends State<ProfileAppScaffold> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //backgroundColor: Colors.white,
      appBar: ExploreAppBar(),
      body: ExplorePage(),
    );
  }
}