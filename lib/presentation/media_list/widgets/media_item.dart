import 'package:flutter/material.dart';

import '../../../core/components/reusable/my_cached_network_image.dart';
import '../../../domain/media_model.dart';

class MediaItem extends StatelessWidget {
  final MediaModel mediaModel;

  const MediaItem({
    super.key,
    required this.mediaModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          MyCachedNetworkImage(imageUrl: mediaModel.thumbnailUrl),
          const Icon(
            Icons.play_circle_filled,
            size: 50,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
