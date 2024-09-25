import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StocksListPage extends StatefulWidget {
  const StocksListPage({super.key});

  @override
  StocksListPageState createState() => StocksListPageState();
}

class StocksListPageState extends State<StocksListPage>
    with AutomaticKeepAliveClientMixin {
  List<dynamic> stocks = []; // 주식 데이터를 담을 리스트
  bool isLoading = true; // 로딩 상태를 나타내는 변수

  @override
  void initState() {
    super.initState();
    fetchStocks(); // 페이지가 초기화되면 주식 데이터를 가져옴
  }

  // API로부터 주식 목록을 가져오는 함수
  Future<void> fetchStocks() async {
    const String apiUrl =
        "https://financialmodelingprep.com/api/v3/stock/list?apikey=GRIGh6O4mE0k2QyZ5tqO7p3izVYytXWV";

    // HTTP GET 요청을 통해 주식 목록을 API에서 가져옴
    var response = await http.get(Uri.parse(apiUrl));

    // API 요청 성공 시
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body); // 응답 본문을 JSON으로 디코딩
      setState(() {
        stocks = jsonData; // 주식 데이터를 리스트에 저장
        isLoading = false; // 로딩 상태 해제
      });
    } else {
      // API 요청 실패 시
      setState(() {
        isLoading = false; // 로딩 상태 해제
      });
      throw Exception('Failed to load stocks'); // 오류 발생
    }
  }

  // AutomaticKeepAliveClientMixin을 통해 상태 유지
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // AutomaticKeepAliveClientMixin 사용 시 필요
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(), // 로딩 중일 때 표시되는 인디케이터
          )
        : ListView.builder(
            itemCount: stocks.length, // 주식 데이터 수에 따라 목록의 항목 개수를 설정
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    title: Text(
                      stocks[index]['symbol'], // 주식 심볼 표시
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black87),
                    ),
                    subtitle: Text(
                      stocks[index]['name'], // 주식 이름 표시
                      style: const TextStyle(
                          fontSize: 14.0, color: Colors.black54),
                    ),
                    trailing: Text(
                      '\$ ${stocks[index]['price']}', // 주식 가격 표시
                      style:
                          const TextStyle(fontSize: 16.0, color: Colors.green),
                    ),
                  ),
                ),
              );
            },
          );
  }
}
