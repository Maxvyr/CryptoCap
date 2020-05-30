import 'dart:convert';
import '../widget/coinModel.dart';
import 'baseCryptoRepository.dart';
import 'package:http/http.dart' as http;

class CryptoRepository extends BaseCryptoRepository {
  static const String _baseUrl =
      "https://min-api.cryptocompare.com"; //url API crypto
  static const int perPage = 50; //crypto showing per page

  final http.Client _httpClient;

  CryptoRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Coin>> getTopCoins({int page}) async {
    List<Coin> coins = [];
    String requestUrl =
        "$_baseUrl/data/top/totalvolfull?limit=$perPage&tsym=USD&page=$page";

    try {
      final response = await _httpClient.get(requestUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<dynamic> coinList = data["Data"];
        coinList.forEach(
          (json) => coins.add(Coin.fromJson(json)),
        );
      }
      return coins;
    } catch (err) {
      throw err;
    }
  }

  @override
  void dispose() {
    _httpClient.close();
  }
}
