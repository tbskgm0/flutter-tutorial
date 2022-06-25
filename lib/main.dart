import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Mercari/mercari_screen.dart';
import 'dart:developer';
import 'youtube/youtube_screen.dart';
import 'residence/residence_screen.dart';
import 'Async/async_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('メイン画面'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YoutubeScreen(),
                  ),
                );
              },
              child: const Text('Youtube'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResidenceScreen(),
                  ),
                );
              },
              child: const Text('residence'),
            ),
            ElevatedButton(
              onPressed: () {
                log('メルカリapp is tapped.');
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MercariScreen(),
                  ),
                );
              },
              child: const Text('Mercari'),
            ),
            ElevatedButton(
              onPressed: () {
                log('Async is tapped.');
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AsyncScreen(),
                  ),
                );
              },
              child: const Text('Async'),
            ),
          ],
        ),
      ),
    );
  }
}

class TransitionButton extends StatelessWidget {
  const TransitionButton({
    Key? key,
    required this.title
  }) : super(key: key);

  final String title;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push<Widget>(
          context,
          MaterialPageRoute(
            builder: (context) => const YoutubeScreen(),
          ),
        );
      },
      child: Text(title),
    );
  }
}