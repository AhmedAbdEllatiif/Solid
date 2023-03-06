import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'di/git_it.dart' as get_it;

import 'presentation/journeys/home/home_screen.dart';

void main() async {
  // ensureInitialized
  WidgetsFlutterBinding.ensureInitialized();

  // set orientation
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  // init getIt
  await get_it.init();

  // runApp
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Solid Test',
      home: HomeScreen(),
    );
  }
}
