import 'package:flutter/material.dart';
import 'package:netflix_clone_3/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix Clone',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            .copyWith(background: Colors.black),
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
            bodyMedium: TextStyle(color: Colors.white, fontSize: 20)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
