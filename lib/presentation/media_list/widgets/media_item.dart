import 'package:flutter/material.dart';

import '../../../core/components/reusable/my_cached_network_image.dart';
import '../../../domain/media_model.dart';

class VideoItem extends StatelessWidget {
  final MediaModel video;

  const VideoItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          MyCachedNetworkImage(imageUrl: video.thumbnailUrl),
          IconButton(
            icon: const Icon(Icons.play_circle_filled,
                size: 50, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
