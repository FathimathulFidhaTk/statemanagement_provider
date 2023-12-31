// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Movie_Provide.dart';
import 'Home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: MyApp(),
    create: (_) => MovieProvider(), // Create a new ChangeNotifier object
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Provider Example',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreenprovider(),
    );
  }
}