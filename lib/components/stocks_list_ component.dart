import 'package:flutter/material.dart';
import '../services/stock_service.dart';

class StocksListPage extends StatefulWidget {
  const StocksListPage({super.key});

  @override
  StocksListPageState createState() => StocksListPageState();
}

class StocksListPageState extends State<StocksListPage>
    with AutomaticKeepAliveClientMixin {
  final StockService stockService =
      StockService(); // StockService 인스턴스 생성 (API 호출 전담)
  List<dynamic> stocks = []; // 주식 데이터를 저장할 리스트
  bool isLoading = true; // 데이터 로딩 상태를 나타내는 변수

  @override
  void initState() {
    super.initState();
    loadStocks(); // 페이지 초기화 시 주식 데이터를 로드
  }

  // 주식 데이터를 비동기 방식으로 API에서 가져오는 함수
  Future<void> loadStocks() async {
    try {
      // StockService를 통해 API 호출, 데이터 로드
      List<dynamic> data = await stockService.fetchStocks();
      setState(() {
        stocks = data; // API에서 받아온 데이터를 stocks 리스트에 저장
        isLoading = false; // 데이터를 불러오면 로딩 상태 해제
      });
    } catch (e) {
      // 데이터 로딩 실패 시에도 로딩 상태를 false로 변경
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // AutomaticKeepAliveClientMixin을 사용하는 경우 호출 필요
    return isLoading
        ? const Center(child: CircularProgressIndicator()) // 로딩 중일 때 표시
        : ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              // 주식 리스트 표시
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

  @override
  bool get wantKeepAlive => true; // 상태가 유지되도록 설정 (탭 간 이동 시 데이터 유지)
}
