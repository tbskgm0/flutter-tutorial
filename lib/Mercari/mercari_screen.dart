import 'package:flutter/material.dart';
import 'package:flutter_tutorial/Mercari/mercari_model.dart';
import 'dart:developer';
import 'package:intl/intl.dart';
import 'package:badges/badges.dart';

class MercariScreen extends StatelessWidget {
  const MercariScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // 画面サイズを取得

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(context),
      floatingActionButton: const FloatingAction(),
      body: MercariBody(size: screenSize),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: TextButton.icon(
        onPressed: () {
          log('back button is tapped.');
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
        label: const Text(''),
      ),
      title: const Text(
        '出品',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Badge(
            shape: BadgeShape.circle,
            position: BadgePosition.topEnd(),
            child: const Icon(
              Icons.home,
              size: 30,
            ),
            badgeContent: const Text(
              '5',
              style: TextStyle(color: Colors.white),
            ),
          ),
          label: 'ホーム',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_outlined,
            size: 30,
            color: Colors.grey,
          ),
          label: 'お知らせ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.camera_alt,
            size: 30,
            color: Colors.grey,
          ),
          label: '出品',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.add_comment,
            size: 30,
          ),
          label: 'メッセージ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
            color: Colors.grey,
            size: 30,
          ),
          label: 'マイページ',
        )
      ],
      selectedItemColor: Colors.blue,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 13,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
    );
  }
}

class MercariBody extends StatelessWidget {
  const MercariBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Listing(size: size),
        ItemList(),
      ],
    );
  }
}

class Listing extends StatelessWidget {
  const Listing({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  final double fontSize = 12;
  final double width = 80;
  final double height = 90;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset('images/start_guide.png'),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 5),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  '出品へのショートカット',
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShortCut(
                  text: '写真を撮る',
                  icon: Icons.photo_camera,
                  onTapped: () => log('写真を撮る is tapped.'),
                ),
                ShortCut(
                  text: 'アルバム',
                  icon: Icons.photo_library,
                  onTapped: () => log('アルバム is tapped.'),
                ),
                ShortCut(
                  text: 'バーコード\n(本・コスメ)',
                  icon: Icons.qr_code_2,
                  onTapped: () => log('バーコード is tapped.'),
                ),
                ShortCut(
                  text: '下書き一覧',
                  icon: Icons.edit_note,
                  onTapped: () => log('下書き一覧 is tapped.'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ショートカットボタン
class ShortCut extends StatelessWidget {
  const ShortCut({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTapped,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Function() onTapped;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85,
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          elevation: 0,
        ),
        onPressed: onTapped,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35),
            Text(text, style: const TextStyle(fontSize: 9)),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({Key? key}) : super(key: key);

  final itemLists = [
    MercariItem('images/thumbnail.jpg', 'プーさん', 500, 1),
    MercariItem('images/camera.png', 'sony a7iii', 5555, 800),
    MercariItem('images/pooh_2.jpeg', 'プーさん', 500000, 153),
    MercariItem('images/camera.png', 'sony a7iii', 5555, 800),
    MercariItem('images/pooh_2.jpeg', 'プーさん', 12048325, 100000000),
    MercariItem('images/camera.png', 'sony a7iii', 5555, 800),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMoreSale(),
        const Divider(
          color: Colors.grey,
          thickness: 1,
          height: 20,
          indent: 10,
          endIndent: 10,
        ),
        for (final item in itemLists)
          Padding(
            padding: const EdgeInsets.all(5),
            child: Item(item: item),
          ),
      ],
    );
  }

  Widget _buildMoreSale() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '売れやすい持ち物',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('使わないモノを出品してみよう！'),
            ],
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            log('すべて見る is tapped.');
          },
          child: const Text('すべて見る>'),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  Item({
    Key? key,
    required this.item,
  }) : super(key: key);

  final MercariItem item;
  final formatter = NumberFormat("#,###.0");

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 70,
          width: 70,
          child: Image.asset(
            item.imageName,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.itemName),
              Text('¥${formatter.format(item.itemPrice)}'),
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department,
                    color: Colors.blue,
                    size: 20,
                  ),
                  Text('${item.watching}人が探しています'),
                ],
              )
            ],
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            log('出品するボタン is tapped.');
          },
          child: const Text('出品する'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}

class FloatingAction extends StatelessWidget {
  const FloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        log('floatingAction button is tapped.');
      },
      child: const Icon(Icons.camera_alt),
      // foregroundColor: Colors.red,
      // focusColor: Colors.red,
      backgroundColor: Colors.red,
    );
  }
}
