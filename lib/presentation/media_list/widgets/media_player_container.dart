import 'package:flutter/material.dart';

class MediaPlayerContainer extends StatelessWidget {
  final VoidCallback onDismiss;

  const MediaPlayerContainer({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          onDismiss();
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 65,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: 16),
                        Text(
                          "How to make your business grow exponentially",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "@ShellySah",
                          style: TextStyle(color: Colors.tealAccent),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 35,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        const Icon(
                          Icons.playlist_play,
                          color: Colors.white,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[900],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                value: 0.4, // Example value, replace with actual percentage
              ),
            ),
          ],
        ),
      ),
    );
  }
}
