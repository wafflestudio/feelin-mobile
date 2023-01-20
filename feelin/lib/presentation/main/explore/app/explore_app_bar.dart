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
        bottom: PreferredSize(
          preferredSize: const Size.fromWidth(200),
          child: TabBar(
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

class CustomTabIndicator extends Decoration {
  final double radius;

  final Color color;


  final double indicatorHeight;

  const CustomTabIndicator({
    this.radius = 2,
    this.indicatorHeight = 4,
    this.color = Colors.black,
  });

  @override
  CustomPainter createBoxPainter([VoidCallback? onChanged]) {
    return CustomPainter(
      this,
      onChanged,
      radius,
      color,
      indicatorHeight,
    );
  }
}

class CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  final double radius;
  final Color color;
  final double indicatorHeight;

  CustomPainter(
      this.decoration,
      VoidCallback? onChanged,
      this.radius,
      this.color,
      this.indicatorHeight,
      ) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    final Paint paint = Paint();
    double xAxisPos = offset.dx + configuration.size!.width / 2;
    double yAxisPos = offset.dy + configuration.size!.height - indicatorHeight/2;
    paint.color = color;

    RRect fullRect = RRect.fromRectAndCorners(
      Rect.fromCenter(
        center: Offset(xAxisPos, yAxisPos),
        width: configuration.size!.width / 5,
        height: indicatorHeight,
      ),
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );

    canvas.drawRRect(fullRect, paint);
  }
}