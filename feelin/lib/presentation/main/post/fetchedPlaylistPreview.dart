import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:music_sns/domain/play/playlist.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';

class FetchedPlaylistPreview extends StatelessWidget{
  final Playlist playlist;
  final PlaylistPreview playlistPreview;
  const FetchedPlaylistPreview({Key? key, required this.playlist, required this.playlistPreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image(
            image: CachedNetworkImageProvider(playlistPreview.thumbnail),
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          playlist.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}