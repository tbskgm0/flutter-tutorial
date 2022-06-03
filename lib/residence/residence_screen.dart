import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'dart:developer';
import 'residence_model.dart';

class ResidenceScreen extends StatelessWidget {
  final _whiteColor = const Color(0xffFFFFFF);
  final _footerUnselectedIconColor = const Color(0xffCECECE);
  final _backgroundColor = const Color(0xffFAF8F5);
  final _primaryColor = const Color(0xff5BADA1);
  final _mainBtnColor = const Color(0xffC9C9C9);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size; // 画面サイズを取得

    return Scaffold(
      appBar: _buildResidenceAppBar(context),
      body: _buildBody(screenSize),
      floatingActionButton: _buildFloatingActionButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildResidenceAppBar(BuildContext context) {
    const suggestionText = 'カウルのおすすめ';
    const reformText = 'リフォームの済みの物件';
    const double buttonWidth = 120;
    const double buttonHeight = 30;
    const double cornerSize = 30;

    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () {
          log('back button is tapped.');
          Navigator.of(context).pop();
        },
        color: _primaryColor,
      ),
      title: Row(
        children: [
          SizedBox(
            width: buttonWidth,
            child: ElevatedButton(
              onPressed: () {
                log('$suggestionText is tapped.');
              },
              child: Text(
                suggestionText,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: TextStyle(
                  color: _primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: _backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(cornerSize),
                ),
              ),
            ),
          ),
          Badge(
            badgeContent: const Text(
              '1',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            child: SizedBox(
              width: buttonWidth,
              child: ElevatedButton(
                onPressed: () {
                  log('$reformText is tapped.');
                },
                child: Text(
                  reformText,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  style: TextStyle(
                    color: _primaryColor,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: _backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(cornerSize),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(7),
          child: IconButton(
            onPressed: () {
              log('add button is tapped.');
            },
            icon: const Icon(Icons.add_circle, size: 35),
            color: _primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(Size size) {
    final houses = [
      Residence('images/house_layout.png', 'Rising Place川崎', '2,000万円',
          '京急本線 京急川崎駅 より 徒歩9分', '1K/21.24m² 南西向き', '2階/15階建 築5年'),
      Residence('images/house_layout.png', 'Rising Place川崎', '2,000万円',
          '京急本線 京急川崎駅 より 徒歩9分', '1K/21.24m² 南西向き', '2階/15階建 築5年'),
      Residence('images/house_layout.png', 'Rising Place川崎', '2,000万円',
          '京急本線 京急川崎駅 より 徒歩9分', '1K/21.24m² 南西向き', '2階/15階建 築5年'),
      Residence('images/house_layout.png', 'Rising Place川崎', '2,000万円',
          '京急本線 京急川崎駅 より 徒歩9分', '1K/21.24m² 南西向き', '2階/15階建 築5年'),
    ];

    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 10),
          child: _buildSuggestionWidget(),
        ),
        for (final house in houses) _buildHouseCell(size, house),
      ],
    );
  }

  Widget _buildSuggestionWidget() {
    final selectedStations = ['東京駅', '品川駅', '川崎駅', '横浜駅', '目黒駅', '恵比寿駅', '渋谷駅'];

    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: _whiteColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey, //色
            spreadRadius: 0.5,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildSuggestionTitle(_primaryColor),
          _buildSuggestion(selectedStations),
        ],
      ),
    );
  }

  Widget _buildSuggestionTitle(Color color) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Text(
            'カウルのおすすめ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Text(
          '新着3件',
          style: TextStyle(
            color: Colors.red,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            log('edit button is tapped.');
          },
          child: Row(
            children: [
              Text(
                '編集',
                style: TextStyle(
                  color: color,
                ),
              ),
              Icon(
                Icons.edit,
                color: color,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSuggestion(selectedStations) {
    const double iconSize = 17;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffD8D9D8),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.train, size: iconSize),
              ),
              for (final station in selectedStations)
                Text(
                  '$station・',
                  // overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                  ),
                ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.paid, size: iconSize),
              ),
              Text('下限なし~2,000万円'),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.info_outline, size: iconSize),
              ),
              Text('1R ~ 4LDK/10m²/徒歩20分'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildHouseCell(Size size, Residence house) {
    const double paddingValue = 10;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _backgroundColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey, //色
              spreadRadius: 0.5,
              blurRadius: 2,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(paddingValue),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.23,
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.5 - paddingValue,
                      color: const Color(0xffD8D9D8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'NO IMAGE',
                            style: TextStyle(
                              color: Color(0xff919191),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto Mono',
                            ),
                          ),
                          Icon(
                            Icons.business_outlined,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.5 - paddingValue,
                      child: Image.asset(house.image),
                    ),
                  ],
                ),
              ),
              Text(
                house.houseName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                house.price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  color: Colors.red,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.train,
                      size: 15,
                    ),
                  ),
                  Text(house.onFootFromStation)
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.space_dashboard_rounded, size: 15),
                  ),
                  Text(house.floorPlan),
                ],
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5),
                    child: Icon(Icons.business_outlined, size: 15),
                  ),
                  Text(house.houseAge),
                ],
              ),
              _buildCellButtons(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCellButtons(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width * 0.45,
            child: TextButton(
              onPressed: () {
                log('興味なし button is tapped.');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  )),
              child: Row(
                children: const [
                  Icon(Icons.delete, color: Colors.grey),
                  Spacer(),
                  Text('興味なし', style: TextStyle(color: Colors.black)),
                  Spacer(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: size.width * 0.45,
            child: TextButton(
              onPressed: () {
                log('興味なし button is tapped.');
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.grey,
                    width: 2,
                  )),
              child: Row(
                children: const [
                  Icon(Icons.favorite_border, color: Colors.grey),
                  Spacer(),
                  Text('お気に入り', style: TextStyle(color: Colors.black)),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: _primaryColor,
      onPressed: () { log('Floating button is tapped.'); },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.search),
          Text('物件'),
        ],
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            color: _primaryColor,
          ),
          label: 'ホーム',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.grey,
          ),
          label: 'お気に入り',
        ),
        BottomNavigationBarItem(
          icon: Badge(
            shape: BadgeShape.circle,
            position: BadgePosition.topEnd(),
            child: const Icon(Icons.chat_bubble_outline),
            badgeContent: const Text(
                '1',
                style: TextStyle(color: Colors.white),
            ),
          ),
          label: 'メッセージ',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.manage_accounts_outlined,
            color: Colors.grey,
          ),
          label: 'マイページ',
        )
      ],
      selectedItemColor: _primaryColor,
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
