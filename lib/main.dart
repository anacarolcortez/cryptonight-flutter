import 'package:cryptonight/ui/views/home_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Cryptonight';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const HomeWidget(),
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.yellow[700],
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: Colors.black,
          ),
        ),
      ),
    );
  }
}
