import 'package:flutter/material.dart';
import 'screens/main_shell.dart';

void main() {
  runApp(const GymTrackApp());
}

class GymTrackApp extends StatelessWidget {
  const GymTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GymTrack',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor:
        const Color(0xFFF5F7F2),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF78A83C),
        ),
      ),
      home: const MainShell(),
    );
  }
}
