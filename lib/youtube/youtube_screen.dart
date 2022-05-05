import 'package:flutter/material.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String text = 'youtube';

    return Scaffold(
      appBar: AppBar(
        title: Text(text),
      ),
      body: Column(
        children: const [
          Text('youtube'),
        ],
      ),
    );
  }

  Widget _GenreItems(BuildContext context) {
    return Column(
      children: const [
        Text('data')
      ],
    );
  }
}
