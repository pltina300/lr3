import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:katsimon_oleh_kiuki_21_9/models/student.dart';
import 'package:katsimon_oleh_kiuki_21_9/widgets/TabScreen.dart';
import 'package:katsimon_oleh_kiuki_21_9/widgets/student_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
    const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: TabScreen(),
    );
  }
}
