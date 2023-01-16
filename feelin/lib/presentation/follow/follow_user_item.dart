import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/profile/profile.dart';
import '../main/profile/app/profile_app.dart';

class FollowUserItem extends StatelessWidget{

  final int index;
  final Profile user;

  const FollowUserItem({Key? key, required this.index, required this.user,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context,).push(
            MaterialPageRoute(builder: (_) => ProfileApp(userId: user.id)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image(
              image: CachedNetworkImageProvider(user.image ?? 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG'),
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(user.username,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}