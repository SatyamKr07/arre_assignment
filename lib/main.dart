import 'package:arre_assignment_sk/application/my_app/my_app_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/media/media_cubit.dart';
import 'presentation/bottom_navigation.dart';
import 'presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arre Voice App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MediaCubit()..loadMedia(),
          ),
          BlocProvider(
            create: (context) => MyAppCubit(),
          ),
        ],
        child: const BottomNavigation(),
      ),
    );
  }
}
