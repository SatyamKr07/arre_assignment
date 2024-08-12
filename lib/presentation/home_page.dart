import 'package:flutter/material.dart';
import '../core/components/default/my_app_bar.dart';
import 'media_list/media_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            toolbarHeight: 80,
            floating: true,
            snap: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomAppBar(),
            ),
          ),
          SliverToBoxAdapter(
            child: MediaList(),
          ),
        ],
      ),
    );
  }
}
