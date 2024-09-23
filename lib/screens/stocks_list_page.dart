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
  List<dynamic> stocks = [];
  bool isLoading = true; // 로딩 상태를 나타내는 변수

  @override
  void initState() {
    super.initState();
    fetchStocks(); // API 호출
  }

  Future<void> fetchStocks() async {
    const String apiUrl =
        "https://financialmodelingprep.com/api/v3/stock/list?apikey=GRIGh6O4mE0k2QyZ5tqO7p3izVYytXWV";

    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        stocks = jsonData;
        isLoading = false; // 데이터를 성공적으로 로드하면 로딩 상태 해제
      });
    } else {
      setState(() {
        isLoading = false; // 오류 발생 시에도 로딩 상태 해제
      });
      throw Exception('Failed to load stocks');
    }
  }

  @override
  bool get wantKeepAlive => true; // 상태를 유지하도록 설정

  @override
  Widget build(BuildContext context) {
    super.build(context); // AutomaticKeepAliveClientMixin 사용 시 필요
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(), // 로딩 중일 때 표시되는 인디케이터
          )
        : ListView.builder(
            itemCount: stocks.length,
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
                      stocks[index]['symbol'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.black87),
                    ),
                    subtitle: Text(
                      stocks[index]['name'],
                      style: const TextStyle(
                          fontSize: 14.0, color: Colors.black54),
                    ),
                    trailing: Text(
                      '\$ ${stocks[index]['price']}',
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
