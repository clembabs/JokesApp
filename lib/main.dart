import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jokes_app/app/ui/jokes_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: RiverpodJokesApp(),
    ),
  );
}

class RiverpodJokesApp extends StatelessWidget {
  const RiverpodJokesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const JokesScreen(),
    );
  }
}
