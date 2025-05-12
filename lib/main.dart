import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:testformvalidation/presentation/booklist.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<Logger>(
          create: (_) => Logger(),
        ),
      ],
      child: const MyApp(),
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form validation',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BookListWidget(),
    );
  }
}

