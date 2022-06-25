import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_tutorial/youtube/youtube_model.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildYoutubeAppBar(context),
      body: _buildYoutubeBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildYoutubeAppBar(BuildContext context) {
    return AppBar(
      title: SizedBox(
        width: 210,
        child: ElevatedButton.icon(
          onPressed: () {
            log('Youtube Button is Tapped.');
          },
          icon: const Icon(Icons.tab),
          label: const Text('Youtube'),
          style: ElevatedButton.styleFrom(
            elevation: 0,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            log('live button is tapped.');
          },
          icon: const Icon(Icons.cast),
        ),
        IconButton(
          onPressed: () {
            log('notification button is tapped.');
          },
          icon: const Icon(Icons.notifications_none),
        ),
        IconButton(
          onPressed: () {
            log('search button is tapped.');
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            log('account button is tapped.');
          },
          icon: const Icon(Icons.account_circle),
        ),
      ],
    );
  }

  Widget _buildYoutubeBody() {
    final _dummmyMovieData = [
      MovieInfo(
          imagePath: 'images/thumbnail.jpg',
          iconPath: 'images/icon.jpeg',
          title: '福井に行く',
          subTitle: 'nishi・1回・一年前'),
      MovieInfo(
          imagePath: 'images/thumbnail.jpg',
          iconPath: 'images/icon.jpeg',
          title: 'フィンランドの国境まで行ってみた',
          subTitle: 'wawawawa・100万回・来月'),
    ];

    return Container(
      color: Colors.black,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _dummmyMovieData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              index == 0 ? _buildGenreItems() : Container(),
              _buildMovieCell(_dummmyMovieData[index]),
            ],
          );
        },
      ),
    );
  }

  // ジャンルWidget
  Widget _buildGenreItems() {
    //TODO: modelから情報を取得するようにする
    final genreList = [
      Genre('急上昇', Icons.local_fire_department, Colors.red),
      Genre('音楽', Icons.music_note, Colors.lightGreen),
      Genre('ゲーム', Icons.sports_esports, Colors.pink),
      Genre('ニュース', Icons.feed, Colors.blue),
      Genre('学び', Icons.school, Colors.green),
      Genre('ライブ', Icons.live_tv, Colors.orange),
      Genre('スポーツ', Icons.sports, Colors.lightBlue),
    ];

    return Container(
      color: Colors.black,
      child: SizedBox(
        height: 200,
        child: GridView.count(
          childAspectRatio: 4,
          crossAxisCount: 2,
          children: [
            for (final genre in genreList)
              _buildGenreButton(genre.text, genre.icon, genre.color),
          ],
        ),
      ),
    );
  }

  Widget _buildGenreButton(String text, IconData icon, MaterialColor color) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton.icon(
        onPressed: () {
          log('$text button is tapped.');
        },
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          primary: color,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  Widget _buildMovieCell(MovieInfo info) {
    return Column(
      children: [
        Image.asset(
          info.imagePath,
          fit: BoxFit.contain,
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(info.iconPath),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  info.title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  info.subTitle,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              label: const Text(('')),
            ),
          ],
        ),
      ],
    );
  }

  // ナビゲーションバー
  Widget _buildBottomNavigationBar() {
    final items = [
      NavigationBarItem(Icons.home, 'ホーム'),
      NavigationBarItem(Icons.find_in_page, '検索'),
      NavigationBarItem(Icons.add_circle_outline, ''),
      NavigationBarItem(Icons.playlist_play, '登録チャンネル'),
      NavigationBarItem(Icons.video_library, 'ライブラリ'),
    ];

    return BottomNavigationBar(
      items: [
        for (final item in items)
          BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.text,
          ),
      ],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      unselectedFontSize: 10,
      selectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
    );
  }
}

// ジャンル情報を保持するクラス
class Genre {
  String text;
  IconData icon;
  MaterialColor color;

  Genre(this.text, this.icon, this.color);
}

class Movie {
  String image;
  String icon;
  String title;
  String channel;
  String watchingCount;
  String date;

  Movie(this.image, this.icon, this.title, this.channel, this.watchingCount,
      this.date);
}

class NavigationBarItem {
  IconData icon;
  String text;

  NavigationBarItem(this.icon, this.text);
}
