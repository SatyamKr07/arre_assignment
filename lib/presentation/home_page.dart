import 'package:flutter/material.dart';
import '../core/components/default/my_app_bar.dart';
import 'media_list/media_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const CustomAppBar(),
      body: MediaList(),
    );
  }
}
