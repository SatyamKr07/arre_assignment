import 'dart:ui';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black.withOpacity(0.1),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 90,
              title: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Arré',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                  // SizedBox(height: 8),
                  Chip(
                    label: Text(
                      'VOICE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.notifications_outlined, size: 28),
                  onPressed: () {
                    // Add notification logic here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.headphones_outlined, size: 28),
                  onPressed: () {
                    // Add headphones logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
