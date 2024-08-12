import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class MyCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;

  const MyCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    double defaultHeight = MediaQuery.of(context).size.height / 4;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height > 0 ? height : defaultHeight,
      width: double.infinity,
      fit: BoxFit.cover,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: height > 0 ? height : defaultHeight,
          color: Colors.white,
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: height > 0 ? height : defaultHeight,
        color: Colors.grey[300],
        child: const Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}
