import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_sns/presentation/main/profile/follow_button.dart';

import '../../application/auth/auth/auth_bloc.dart';
import '../../application/follow/follow_bloc.dart';
import '../../domain/profile/profile.dart';
import '../main/profile/app/profile_app.dart';

class FollowUserItem extends StatefulWidget{

  final int index;
  final Profile profile;

  const FollowUserItem({Key? key, required this.index, required this.profile,}) : super(key: key);

  @override
  State<FollowUserItem> createState() => _FollowUserItemState();
}

class _FollowUserItemState extends State<FollowUserItem> {
  bool isFollowed = false;

  @override
  void initState(){
    super.initState();
    isFollowed = widget.profile.isFollowed!;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        Navigator.of(context,).push(
            MaterialPageRoute(builder: (_) => ProfileApp(userId: widget.profile.id),
            ),
        ).then((value){
          if(value != null){
            setState(() {
              isFollowed = value;
            });
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: widget.profile.profileImage == null ? const AssetImage('assets/images/user_default.png') as ImageProvider : CachedNetworkImageProvider(widget.profile.profileImage!),
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width-192,
              child: AutoSizeText(widget.profile.username,
                minFontSize: 11,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                ),
              ),
            ),
            const Spacer(),
            if(widget.profile.id != context.watch<AuthBloc>().state.id) FollowButton(isFollowed: isFollowed, function: (){
              if(!isFollowed){
                context.read<FollowBloc>().add(FollowEvent.followRequest(widget.index,));
                setState(() {
                  isFollowed = true;
                });
              }else{
                context.read<FollowBloc>().add(FollowEvent.unfollowRequest(widget.index,));
                setState(() {
                  isFollowed = false;
                });
              }
            }, isSmall: true)
          ],
        ),
      ),
    );
  }
}