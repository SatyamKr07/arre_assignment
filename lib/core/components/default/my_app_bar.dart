import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey[200]!.withOpacity(0.1),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 240, // Increased from 200
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32),
                  Row(
                    children: [
                      Text(
                        'Arré',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(width: 8),
                    ],
                  ),
                  // SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.surround_sound_outlined,
                          color: Colors.white,
                          size: 10,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'VOICE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined, size: 24),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.message_outlined, size: 24),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  } // Increased from kToolbarHeight + 20
}
