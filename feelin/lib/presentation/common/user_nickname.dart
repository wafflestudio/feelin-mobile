import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/profile/profile.dart';
import '../main/profile/app/profile_app.dart';

class UserNickname extends StatelessWidget{

  final Profile writer;
  final bool isSmall;

  const UserNickname({Key? key, required this.writer, this.isSmall = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isSmall ? null : (){
        Navigator.of(context,).push(
            MaterialPageRoute(builder: (_) => ProfileApp(userId: writer.id)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(isSmall ? 9 : 12),
            child: Image(
              image: CachedNetworkImageProvider(writer.image ?? 'https://t2.daumcdn.net/thumb/R720x0/?fname=http://t1.daumcdn.net/brunch/service/guest/image/caTw7KNdDMeoe833RVMZ4Y11ErQ.JPG'),
              width: isSmall ? 18 : 24,
              height: isSmall ? 18 : 24,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(writer.username,
            style: TextStyle(
              fontWeight: isSmall ? FontWeight.w500 : FontWeight.w700,
              fontSize: isSmall ? 12 : 14
            ),
          ),
        ],
      ),
    );
  }



}