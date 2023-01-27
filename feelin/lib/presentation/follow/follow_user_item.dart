import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/profile/profile.dart';
import '../main/profile/app/profile_app.dart';

class FollowUserItem extends StatelessWidget{

  final int index;
  final Profile profile;

  const FollowUserItem({Key? key, required this.index, required this.profile,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context,).push(
            MaterialPageRoute(builder: (_) => ProfileApp(userId: profile.id)));
      },
      child: AbsorbPointer(
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image(
                image: profile.profileImage == null ? AssetImage('assets/images/user_default.png') as ImageProvider : CachedNetworkImageProvider(profile.profileImage!),
                width: 48,
                height: 48,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(profile.username,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}