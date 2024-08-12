import 'package:flutter/material.dart';

import '../../../core/components/reusable/my_cached_network_image.dart';
import '../../../domain/media_model.dart';

class MediaItem extends StatelessWidget {
  final MediaModel mediaModel;
  final Function() onTap;

  const MediaItem({
    super.key,
    required this.mediaModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          MyCachedNetworkImage(imageUrl: mediaModel.thumbnailUrl),
          GestureDetector(
            onTap: onTap,
            child: const Icon(
              Icons.play_circle_filled,
              size: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
