import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../common/custom_tab_indicator.dart';

class ExploreAppBarBottom extends StatefulWidget with PreferredSizeWidget {
  final TabController tabController;

  const ExploreAppBarBottom({Key? key, required this.tabController}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  State<ExploreAppBarBottom> createState() => _ExploreAppBarBottomState();
}
class _ExploreAppBarBottomState extends State<ExploreAppBarBottom> {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: PreferredSize(
        preferredSize: const Size.fromWidth(200),
        child: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: TabBar(
            controller: widget.tabController,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            labelColor: Colors.black,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            unselectedLabelColor: FeelinColorFamily.gray500,
            indicatorColor: Colors.black,
            indicator: const CustomTabIndicator(),
            indicatorWeight: 2,
            tabs: const [
              Tab(
                child: Text('Following'),
              ),
              Tab(
                child: Text('Discover'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}