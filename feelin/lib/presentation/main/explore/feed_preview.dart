import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_sns/application/explore/explore_bloc.dart';
import 'package:music_sns/presentation/common/user_nickname.dart';
import 'package:music_sns/presentation/main/explore/track_preview.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_page.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';
import '../../common/bouncing_widget.dart';

class FeedPreview extends StatefulWidget {
  final int index;
  final Post post;
  final bool isFollowing;

  const FeedPreview({Key? key, required this.index, required this.post, required this.isFollowing}) : super(key: key);

  @override
  State<FeedPreview> createState() => _FeedPreviewState();
}

class _FeedPreviewState extends State<FeedPreview> {
  bool isLiked = false;

  @override
  void initState(){
    super.initState();
    isLiked = widget.post.isLiked!;
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(
              builder: (context){
                return BlocProvider(
                    create: (context) => getIt<PlaylistInfoBloc>(),
                    child: PlaylistInfoPage(post: widget.post, postId: widget.post.id, heroNumber: widget.index, width: MediaQuery.of(context).size.width,));
              },
            ),
            ).then((value){
              if(value != null){
                setState(() {
                  widget.post.title = value.title;
                  widget.post.content = value.content;
                  isLiked = value.isLiked;
                  widget.post.likeCount = value.likeCount;
                });
            }});
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: UserNickname(profile: widget.post.writer!, isBig: true,),
              ),
              const SizedBox(height: 5,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: FeelinColorFamily.gray100,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Hero(
                          tag: "playlistCover${widget.index}",
                          child: Image(
                            image: CachedNetworkImageProvider(
                                widget.post.playlist.thumbnail!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    if(widget.post.trackPreview!.isNotEmpty)ClipRRect(
                      //borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                      child: Container(
                        padding: EdgeInsets.only(top: 6),
                        height: 60,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.post.trackPreview!.length,
                            itemBuilder: (context, index){
                              if(index == 0){
                                return Padding(
                                    padding: const EdgeInsets.only(left: 6, right: 6),
                                    child: TrackPreview(index: index, track: widget.post.trackPreview![index]));
                              }
                              return Padding(
                                  padding: const EdgeInsets.only(right: 6),
                                  child: TrackPreview(index: index, track: widget.post.trackPreview![index]));
                            }),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(13, 10, 0, 10),
                      constraints: const BoxConstraints(minHeight: 60, minWidth: double.infinity),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width-86,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    widget.post.title,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                                if(widget.post.content.isNotEmpty)Text(
                                  widget.post.content,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: FeelinColorFamily.gray600,
                                    letterSpacing: -0.41,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -10,
                            right: 0,
                            child: SizedBox(
                              width: 52,
                              child: GestureDetector(
                                onTap: (){
                                  if(!isLiked){
                                    context.read<ExploreBloc>().add(ExploreEvent.likeRequest(widget.index, widget.isFollowing));
                                    setState(() {
                                      isLiked = true;
                                    });
                                  }else{
                                    context.read<ExploreBloc>().add(ExploreEvent.unlikeRequest(widget.index, widget.isFollowing));
                                    setState(() {
                                      isLiked = false;
                                    });
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 8, 20, 20),
                                  child: BouncingWidget(
                                    disabled: false,
                                    child: SvgPicture.asset(
                                      isLiked ? 'assets/icons/heart_filled.svg'
                                          : 'assets/icons/heart.svg',
                                      color: isLiked ? FeelinColorFamily.redPrimary : Colors.black,
                                      width: 24,
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}