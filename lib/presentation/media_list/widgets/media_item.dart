import 'package:flutter/material.dart';

import '../../../core/components/reusable/my_cached_network_image.dart';
import '../../../domain/media_model.dart';

class MediaItem extends StatelessWidget {
  final MediaModel mediaModel;
  final Function(MediaModel) onTap;

  const MediaItem({super.key, required this.mediaModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(mediaModel),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            MyCachedNetworkImage(imageUrl: mediaModel.thumbnailUrl),
            IconButton(
              icon: const Icon(Icons.play_circle_filled,
                  size: 50, color: Colors.white),
              onPressed: () => onTap(mediaModel),
            ),
          ],
        ),
      ),
    );
  }
}
