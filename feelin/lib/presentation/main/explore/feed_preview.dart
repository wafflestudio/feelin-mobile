import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:music_sns/application/explore/explore_bloc.dart';
import 'package:music_sns/domain/streaming/vendor.dart';
import 'package:music_sns/presentation/common/user_nickname.dart';
import 'package:music_sns/presentation/main/explore/track_preview.dart';
import 'package:music_sns/presentation/main/playlist_info/playlist_info_page.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../application/info/playlist_info_bloc.dart';
import '../../../domain/play/post.dart';
import '../../../injection.dart';
import '../../common/bouncing_widget.dart';
import '../../common/custom_visibility_detector.dart';

class FeedPreview extends StatefulWidget {
  final int index;
  final Post post;
  final bool isFollowing;
  final Function? deleteItem;

  const FeedPreview({Key? key, required this.index, required this.post, required this.isFollowing, this.deleteItem}) : super(key: key);

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
        return CustomVisibilityDetector(
          onVisibleGained: (){
            setState(() {
              isLiked = widget.post.isLiked!;
            });
          },
          child: GestureDetector(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(
                builder: (context){
                  return BlocProvider(
                      create: (context) => getIt<PlaylistInfoBloc>()..add(PlaylistInfoEvent.loadRequest(widget.post.id)),
                      child: PlaylistInfoPage(post: widget.post, postId: widget.post.id,
                        heroTag: 'Feed${widget.isFollowing}${widget.post.id}',
                        width: MediaQuery.of(context).size.width,
                        deleteItem: widget.deleteItem,));
                },
              ),
              ).whenComplete(() => setState((){
                isLiked = widget.post.isLiked!;
              }));
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
                      borderRadius: BorderRadius.circular(0),
                      color: FeelinColorFamily.gray100,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.0,
                        child: Hero(
                          tag: "playlistCoverFeed${widget.isFollowing}${widget.post.id}",
                          child: Image(
                            image: widget.post.playlist.thumbnail == null ? const AssetImage('assets/images/cover_default.png') as ImageProvider : CachedNetworkImageProvider(widget.post.playlist.thumbnail!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if(widget.post.playlist.mainTracks!.isNotEmpty)ClipRRect(
                        //borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                        child: Container(
                          padding: const EdgeInsets.only(top: 6),
                          height: 60,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              itemCount: widget.post.playlist.mainTracks!.length,
                              itemBuilder: (context, index){
                                if(index == 0){
                                  return Padding(
                                      padding: const EdgeInsets.only(left: 6, right: 6),
                                      child: TrackPreview(index: index, track: widget.post.playlist.mainTracks![index]));
                                }
                                return Padding(
                                    padding: const EdgeInsets.only(right: 6),
                                    child: TrackPreview(index: index, track: widget.post.playlist.mainTracks![index]));
                              }),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(15, 12, 0, 10),
                        constraints: const BoxConstraints(minHeight: 70, minWidth: double.infinity),
                        child: Stack(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 86,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(widget.post.playlist.originalVendorPlaylist != null) SizedBox(
                                    height: 25,
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Image.asset(
                                        Vendor.strToVendor(widget.post.playlist.originalVendorPlaylist!.vendor) == Vendor.spotify ? 'assets/logos/spotify_logo.png' : 'assets/logos/apple_music_logo.png',
                                        height: 16,
                                      ),
                                    ),
                                  ),
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
                              bottom: -5,
                              right: 0,
                              child: SizedBox(
                                width: 52,
                                child: GestureDetector(
                                  onTap: (){
                                    if(!isLiked){
                                      context.read<ExploreBloc>().add(ExploreEvent.likeRequest(widget.index, widget.isFollowing));
                                      setState(() {
                                        isLiked = true;
                                        widget.post.likeCount = widget.post.likeCount! + 1;
                                      });
                                    }else{
                                      context.read<ExploreBloc>().add(ExploreEvent.unlikeRequest(widget.index, widget.isFollowing));
                                      setState(() {
                                        isLiked = false;
                                        widget.post.likeCount = widget.post.likeCount! - 1;
                                      });
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 8, 13, 10),
                                    child: Column(
                                      children: [
                                        BouncingWidget(
                                          disabled: false,
                                          child: Image.asset(
                                            isLiked ? 'assets/icons/heart_filled.png'
                                                : 'assets/icons/heart.png',
                                            color: isLiked ? FeelinColorFamily.redPrimary : Colors.black,
                                            width: 28,
                                            height: 28,
                                          ),
                                        ),
                                        Text(NumberFormat.compact().format(widget.post.likeCount),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: -0.41,
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
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
          ),
        );
      }
    );
  }
}
