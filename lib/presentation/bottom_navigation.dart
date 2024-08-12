import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../application/my_app/my_app_cubit.dart';
import '../application/my_app/my_app_state.dart';
import '../core/components/default/my_app_bar.dart';
import 'home_page.dart';
import 'media_list/widgets/media_player_container.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late PageController _pageController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  final List<Widget> _pages = <Widget>[
    const HomePage(),
    Center(child: const Text('Search')),
    Center(child: const Text('Voice')),
    Center(child: const Text('Community')),
    const Text('Profile'),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAppCubit, MyAppState>(
      listener: (context, state) {
        if (state.isMediaPlayerVisible) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: _pages,
              ),
              if (state.isMediaPlayerVisible)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: MediaPlayerContainer(
                      onDismiss: () =>
                          context.read<MyAppCubit>().hideMediaPlayer(),
                    ),
                  ),
                ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: BottomBarCreative(
                      items: const [
                        TabItem(icon: Icons.home),
                        TabItem(icon: Icons.search),
                        TabItem(icon: Icons.mic),
                        TabItem(icon: Icons.group),
                        TabItem(icon: Icons.person),
                      ],
                      backgroundColor: state.isMediaPlayerVisible
                          ? Colors.black
                          : Colors.black54.withOpacity(0.5),
                      color: _selectedIndex == 2 ? Colors.orange : Colors.white,
                      colorSelected: Colors.orange,
                      indexSelected: _selectedIndex,
                      onTap: _onItemTapped,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                  ),
                ),
              ),
              // const Positioned(
              //   top: 0,
              //   left: 0,
              //   right: 0,
              //   child: CustomAppBar(
              //       // Remove shadow
              //       ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
