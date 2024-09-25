import 'package:calcullator/Screen/calculateScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme:  ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.black)
);

void main() {
  runApp(const  ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: theme,
      home: const Calculatescreen(),
      debugShowCheckedModeBanner: false,
   
    );
  }
}
