import 'package:http/http.dart' as http;
import 'dart:convert';

class StockService {
  static const String apiUrl =
      "https://financialmodelingprep.com/api/v3/stock/list?apikey=GRIGh6O4mE0k2QyZ5tqO7p3izVYytXWV";

  Future<List<dynamic>> fetchStocks() async {
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load stocks');
    }
  }
}
