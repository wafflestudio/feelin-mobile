import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class ExploreAppBar extends StatefulWidget with PreferredSizeWidget {
  final Function function;

  const ExploreAppBar({Key? key, required this.function,}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

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
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: (){
            widget.function();
          },
          child: Container(
            width: double.infinity,
            height: 100,
            color: Colors.white,
            child: const Center(
              child: Text('Feelin\'',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}