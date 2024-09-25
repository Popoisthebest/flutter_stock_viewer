import 'package:acoes_internacionais/components/stocks_list_%20component.dart';
import 'package:flutter/material.dart';

// AppBar title 스타일 지정
const TextStyle appBarTextStyle = TextStyle(
  color: Color(0xFF7B6EB2),
  fontSize: 20,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  height: 0,
);

// TabBar의 title 스타일 지정
const TextStyle sectionTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w600,
  height: 0,
);

// TextField의 hintText 스타일 지정
const TextStyle searchHintTextStyle = TextStyle(
  color: Colors.black54,
  fontSize: 14,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
  height: 0,
);

const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20.0);
const EdgeInsets searchBoxPadding = EdgeInsets.symmetric(horizontal: 25.0);
const EdgeInsets appBarPadding = EdgeInsets.only(top: 70.0);

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildSectionHeader(),
            ),
            _buildSearchBox(),
            const SizedBox(height: 20),
            const TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color(0xA57B6EB2),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(text: "인기"),
                Tab(text: "보유"),
                Tab(text: "즐겨찾기"),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: TabBarView(
                children: [
                  StocksListPage(),
                  StocksListPage(),
                  StocksListPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // AppBar 생성 함수
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      flexibleSpace: Padding(
        padding: appBarPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/icons/back_arrow.png"),
            const Text(
              "주식",
              textAlign: TextAlign.center,
              style: appBarTextStyle,
            ),
            Image.asset("assets/icons/home.png"),
          ],
        ),
      ),
    );
  }

  // 섹션 헤더 (타이틀과 이미지) 생성 함수
  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          '이번 주 인기있는 종목은\n무엇일까요?',
          style: sectionTitleTextStyle,
        ),
        Image.asset("assets/images/fire.png"),
      ],
    );
  }

  // 검색 박스 생성 함수
  Widget _buildSearchBox() {
    return Padding(
      padding: horizontalPadding,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: const Color(0xFF7B6EB2), width: 1),
        ),
        child: Padding(
          padding: searchBoxPadding,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 12.0),
              border: InputBorder.none,
              suffixIcon: SizedBox(
                width: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/icons/search.png"),
                    Image.asset("assets/icons/line.png"),
                    Image.asset("assets/icons/x.png"),
                  ],
                ),
              ),
              hintText: "검색어를 입력해주세요",
              hintStyle: searchHintTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
