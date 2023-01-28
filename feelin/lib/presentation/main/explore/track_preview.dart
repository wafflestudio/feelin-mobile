import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_sns/presentation/style/colors.dart';

import '../../../domain/play/main_track.dart';

class TrackPreview extends StatelessWidget {
  final int index;
  final MainTrack track;

  const TrackPreview({Key? key, required this.index, required this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 152,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6)
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Image(
              image: CachedNetworkImageProvider(
                  track.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: 94,
            height: 36,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    track.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black,
                    letterSpacing: -0.41,
                  ),
                ),
                Text(
                    track.artists,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: FeelinColorFamily.gray700,
                    letterSpacing: -0.41
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}