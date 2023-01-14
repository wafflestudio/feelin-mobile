import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class ExploreAppBar extends StatefulWidget with PreferredSizeWidget {
  final Function function;
  final TabController tabController;

  const ExploreAppBar({Key? key, required this.function, required this.tabController}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<ExploreAppBar> createState() => _ExploreAppBarState();
}
class _ExploreAppBarState extends State<ExploreAppBar> {

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: (){
            widget.function();
          },
          child: const Text('Feelin\'',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromWidth(200),
          child: TabBar(
            controller: widget.tabController,
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            labelColor: Colors.black,
            labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            unselectedLabelColor: FeelinColorFamily.gray500,
            indicatorColor: Colors.transparent,
            indicator: const BoxDecoration(color: Colors.transparent),
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