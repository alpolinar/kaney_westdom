import 'package:flutter/material.dart';
import 'package:kanye_westdom/screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yeezus!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const LoadingScreen(),
    );
  }
}
