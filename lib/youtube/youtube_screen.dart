import 'package:flutter/material.dart';

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
            print('Youtube Button is Tapped.');
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
            print('live button is tapped.');
          },
          icon: const Icon(Icons.cast),
        ),
        IconButton(
          onPressed: () {
            print('notification button is tapped.');
          },
          icon: const Icon(Icons.notifications_none),
        ),
        IconButton(
          onPressed: () {
            print('search button is tapped.');
          },
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {
            print('account button is tapped.');
          },
          icon: const Icon(Icons.account_circle),
        ),
      ],
    );
  }

  Widget _buildYoutubeBody() {
    return Container(
      color: Colors.black,
      child: ListView(
        children: [
          _buildGenreItems(),
          _buildMovieItems(),
        ],
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
          print('$text button is tapped.');
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

  // 動画一覧のWidget
  Widget _buildMovieItems() {
    final movies = [
      Movie('images/thumbnail.jpg', 'images/icon.jpeg', '福井に行く', 'nishi', '1回', '一年前'),
      Movie('images/thumbnail.jpg', 'images/icon.jpeg', 'フィンランドの国境まで行ってみた', 'wawawawa', '100万回', '来月'),
      Movie('images/thumbnail.jpg', 'images/icon.jpeg', '花束のような恋をしました', 'movieCH', '1億回', '一日前'),
      Movie('images/thumbnail.jpg', 'images/icon.jpeg', '水平線', 'Back Number', '1億回', '半年前'),
    ];

    return Column(
      children: [
        for (final movie in movies)
          _buildMovieCell(Image.asset(movie.image), movie.icon, movie.title, movie.channel,
              movie.watchingCount, movie.date)
      ],
    );
  }

  Widget _buildMovieCell(Image image, String icon, String title, String channel,
      String watchingCount, String date) {
    return Column(
      children: [
        image,
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(icon),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      '$channel・',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      '$watchingCount・',
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      date,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
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

  Movie(this.image, this.icon, this.title, this.channel,
      this.watchingCount, this.date);
}

class NavigationBarItem {
  IconData icon;
  String text;

  NavigationBarItem(this.icon, this.text);
}
