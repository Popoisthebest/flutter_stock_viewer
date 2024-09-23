import 'package:flutter/material.dart';

import 'stocks_list_page.dart';

class Newstockscreen extends StatefulWidget {
  const Newstockscreen({super.key});

  @override
  State<Newstockscreen> createState() => _NewstockscreenState();
}

class _NewstockscreenState extends State<Newstockscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset("assets/icons/back_arrow.png"),
              const Text(
                "주식",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF7B6EB2),
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Image.asset("assets/icons/home.png"),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3, // 탭의 수
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    '이번 주 인기있는 종목은\n무엇일까요?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Image.asset("assets/images/fire.png")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  border: Border(
                    top: BorderSide(width: 1, color: Color(0xFF7B6EB2)),
                    right: BorderSide(width: 1, color: Color(0xFF7B6EB2)),
                    bottom: BorderSide(width: 1, color: Color(0xFF7B6EB2)),
                    left: BorderSide(width: 1, color: Color(0xFF7B6EB2)),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                            Image.asset("assets/icons/x.png")
                          ],
                        ),
                      ),
                      hintText: "검색어를 입력해주세요",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
            // 아래 TabBarView로 탭에 해당하는 콘텐츠를 구현
            const Expanded(
              child: SizedBox(
                child: TabBarView(
                  children: [
                    StocksListPage(),
                    StocksListPage(),
                    StocksListPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
