import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_sns/domain/custom/marquee.dart';
import 'package:music_sns/domain/play/post.dart';
import 'package:music_sns/domain/play/track.dart';

class FocusedPreView extends StatefulWidget {
  final Widget child;
  final Widget secondChild;
  final double? menuItemExtent;
  final double? menuWidth;
  final Post post;
  final bool? animateMenuItems;
  final BoxDecoration? menuBoxDecoration;
  final Function onPressed;
  final Duration? duration;
  final double? blurSize;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;
  final bool openWithTap;
  final bool isRight;
  final int index;

  const FocusedPreView(
      {Key? key,
        required this.index,
        required this.isRight,
        required this.child,
        required this.secondChild,
        required this.onPressed,
        required this.post,
        this.duration,
        this.menuBoxDecoration,
        this.menuItemExtent,
        this.animateMenuItems,
        this.blurSize,
        this.blurBackgroundColor,
        this.menuWidth,
        this.bottomOffsetHeight,
        this.menuOffset,
        this.openWithTap = false})
      : super(key: key);

  @override
  State<FocusedPreView> createState() => _FocusedPreviewState();
}

class _FocusedPreviewState extends State<FocusedPreView> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = const Offset(0, 0);
  Size? childSize;

  getOffset(){
    RenderBox renderBox = containerKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: containerKey,
        onTap: () async {
          widget.onPressed();
          if (widget.openWithTap) {
            await openMenu(context);
          }

        },
        onLongPress: () async {

          if (!widget.openWithTap) {
            await openMenu(context);
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: widget.child
            ),
            Positioned(
              child: widget.secondChild,
            ),
          ],
        ),
    );
  }

  Future openMenu(BuildContext context) async {
    getOffset();
    await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: widget.duration ?? const Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              animation = Tween(begin: 0.0, end: 1.0).animate(animation);
              return FadeTransition(
                  opacity: animation,
                  child: FocusedMenuDetails(
                    itemExtent: widget.menuItemExtent,
                    menuBoxDecoration: widget.menuBoxDecoration,
                    secondChild: widget.secondChild,
                    childOffset: childOffset,
                    childSize: childSize,
                    post: widget.post,
                    blurSize: widget.blurSize,
                    menuWidth: widget.menuWidth,
                    blurBackgroundColor: widget.blurBackgroundColor,
                    animateMenu: widget.animateMenuItems ?? true,
                    bottomOffsetHeight: widget.bottomOffsetHeight ?? 0,
                    menuOffset: widget.menuOffset ?? 0,
                    onPressed: widget.onPressed,
                    isRight: widget.isRight,
                    index: widget.index,
                    child: widget.child,
                  ));
            },
            fullscreenDialog: true,
            opaque: false));
  }
}

class FocusedMenuDetails extends StatelessWidget {
  final Post post;
  final BoxDecoration? menuBoxDecoration;
  final Offset childOffset;
  final double? itemExtent;
  final Size? childSize;
  final Widget child;
  final Widget secondChild;
  final bool animateMenu;
  final double? blurSize;
  final double? menuWidth;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;
  final Function onPressed;
  final bool isRight;
  final int index;

  const FocusedMenuDetails(
      {Key? key, required this.post, required this.child, required this.secondChild,
        required this.childOffset, required this.childSize,required this.menuBoxDecoration,
        required this.itemExtent,required this.animateMenu,required this.blurSize,
        required this.blurBackgroundColor,required this.menuWidth, this.bottomOffsetHeight,
        this.menuOffset, required this.onPressed, required this.isRight, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.7;
    final listHeight = 28 + post.playlist.tracks!.length * (itemExtent ?? 53.0);

    final maxMenuWidth = menuWidth??(size.width * 0.50);
    const menuHeight = 100.0;
    final playlistHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final leftOffset = (childOffset.dx+ childSize!.width ) < size.width ? childOffset.dx: (childOffset.dx-childSize!.width+childSize!.width);
    final topOffsetOfChild = (childOffset.dy + childSize!.height) < size.height - bottomOffsetHeight! ? childOffset.dy : (size.height - childSize!.height) * 0.5;
    final topOffset = (topOffsetOfChild + menuHeight + childSize!.height) < size.height - bottomOffsetHeight! ? topOffsetOfChild + childSize!.height + menuOffset! : topOffsetOfChild - menuHeight - menuOffset!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: blurSize??4, sigmaY: blurSize??4),
                child: Container(
                  color: (blurBackgroundColor??Colors.black).withOpacity(0.7),
                ),
              )),
          Positioned(
            top: (size.height - playlistHeight) * 0.5,
            left: (isRight) ? childOffset.dx - maxMenuWidth : childOffset.dx + childSize!.width,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 200),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              tween: Tween(begin: 0.0, end: 1.0),
              child: Container(
                width: maxMenuWidth,
                height: playlistHeight,
                padding: const EdgeInsets.all(10),
                decoration: menuBoxDecoration ??
                    const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 1)]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: ListView.builder(
                    itemCount: post.playlist.tracks!.length,
                    padding: EdgeInsets.zero,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      Track item = post.playlist.tracks![index];
                      Widget listItem = GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap:
                              () {
                            Navigator.pop(context);
                            //item.onPressed();
                            onPressed();
                          },
                          child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(bottom: 1),
                              //color: item.backgroundColor ?? Colors.white,
                              height: itemExtent ?? 53.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Marquee(
                                        direction: Axis.horizontal,
                                        child: Text(
                                            item.title,
                                          textAlign: TextAlign.start,
                                          style: const TextStyle(
                                            color: Color(0xff00C19C),
                                            fontSize: 17.5
                                          ),
                                        ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Marquee(
                                          direction: Axis.horizontal,
                                          child: ListView.separated(
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: item.artists.length,
                                              itemBuilder: (context, index){
                                                return Text(
                                                  item.artists[index].name,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                     color: Color(0xff7077D5),
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (context, index) => const Text(
                                                ", ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Color(0xff7077D5),
                                              ),
                                              ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )));
                      if (animateMenu) {
                        return TweenAnimationBuilder(
                            builder: (context, dynamic value, child) {
                              return Transform(
                                transform: Matrix4.rotationX(1.5708 * value),
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            tween: Tween(begin: 1.0, end: 0.0),
                            duration: Duration(milliseconds: index * 200),
                            child: listItem);
                      } else {
                        return listItem;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: topOffset,
            left: leftOffset,
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 200),
              builder: (BuildContext context, dynamic value, Widget? child) {
                return Transform.scale(
                  scale: value,
                  alignment: Alignment.center,
                  child: child,
                );
              },
              tween: Tween(begin: 0.0, end: 1.0),
              child: Container(
                width: childSize!.width,
                height: menuHeight,
                decoration: menuBoxDecoration ??
                    const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 1)]),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: TweenAnimationBuilder(
                      builder: (context, dynamic value, child) {
                        return Transform(
                          transform: Matrix4.rotationX(1.5708 * value),
                          alignment: Alignment.bottomCenter,
                          child: child,
                        );
                      },
                      tween: Tween(begin: 1.0, end: 0.0),
                      duration: const Duration(milliseconds: 200),
                      child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap:
                              () {
                            Navigator.pop(context);
                            //item.onPressed();
                            onPressed();
                          },
                          child: Hero(
                            tag: "playlistTitle$index",
                            child: Material(
                              type: MaterialType.transparency,
                              child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(bottom: 1),
                                  //color: item.backgroundColor ?? Colors.white,
                                  //height: itemExtent ?? 50.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          post.playlist.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),

                                        Flexible(
                                            child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              text: TextSpan(
                                                text: post.content,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),)
                                      ],
                                    ),
                                  ),
                              ),
                            ),
                          ),
                      ),
                  ),

                ),
              ),
            ),
          ),
          Positioned(top: topOffsetOfChild, left: childOffset.dx, child: AbsorbPointer(absorbing: true, child: SizedBox(
              width: childSize!.width,
              height: childSize!.height,
              child: child))),
          //Positioned(child: Visibility(child: secondChild, visible: false,)),
          Positioned(top: topOffsetOfChild, left: childOffset.dx, child: AbsorbPointer(absorbing: true, child: SizedBox(
              width: childSize!.width,
              height: childSize!.height,
              child: Visibility(visible: false,child: secondChild,)))),
        ],
      ),
    );
  }
}