import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_sns/domain/play/track.dart';
import 'package:music_sns/presentation/style/colors.dart';

class TrackPreview extends StatelessWidget {
  final int index;
  final Track track;

  const TrackPreview({Key? key, required this.index, required this.track}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 36,
      child: Row(
        children: [
          SizedBox(
            width: 36,
            height: 36,
            child: Image(
              image: CachedNetworkImageProvider(
                  track.album.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: 94,
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
                    List.generate(track.artists.length, (index) => track.artists[index].name).join(', '),
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