import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

class ExploreAppBar extends StatefulWidget with PreferredSizeWidget {
  final Function function;

  const ExploreAppBar({Key? key, required this.function,}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height*0.9);

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
          child: Container(
            width: double.infinity,
            color: Colors.transparent,
            child: Center(
              child: RichText(
                text: TextSpan(
                  style:  const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  children: [
                    const TextSpan(text: 'Feelin',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: '’',
                      style: TextStyle(
                        color: FeelinColorFamily.redPrimary,
                      ),
                    ),
                  ]
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