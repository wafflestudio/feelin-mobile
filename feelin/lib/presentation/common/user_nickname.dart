import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/profile/profile.dart';
import '../main/profile/app/profile_app.dart';

class UserNickname extends StatelessWidget{

  final Profile profile;
  final bool isBig;

  const UserNickname({Key? key, required this.profile, this.isBig = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  (){
        Navigator.of(context,).push(
            CupertinoPageRoute(builder: (_) => ProfileApp(userId: profile.id)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(isBig ? 16 : 12),
            child: Image(
              image: profile.profileImage == null ? const AssetImage('assets/images/user_default.png') as ImageProvider : CachedNetworkImageProvider(profile.profileImage!),
              width: isBig ? 36 : 24,
              height: isBig ? 36 : 24,
              fit: BoxFit.cover,
            )
          ),
          const SizedBox(
            width: 8,
          ),
          Text(profile.username,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: -0.41,
            ),
          ),
        ],
      ),
    );
  }
}