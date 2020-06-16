import 'dart:convert';
import '../controller/variables.dart';
import '../widget/coinModel.dart';
import 'baseCryptoRepository.dart';
import 'package:http/http.dart' as http;

class CryptoRepository extends BaseCryptoRepository {
  static const String _baseUrl =
      "https://min-api.cryptocompare.com"; //url API crypto
  static const int perPage = 20; //crypto showing per page
  final  String _apikey =  "ff889783f05a0e3991d3e4f4566e573dcf787947457348d7badeca749042d759";
  String _currency = currencyChoice;

  final http.Client _httpClient;

  CryptoRepository({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  @override
  Future<List<Coin>> getTopCoins({int page}) async {
    List<Coin> coins = [];
    String requestUrl =
        "$_baseUrl/data/top/mktcapfull?limit=$perPage&tsym=$_currency&page=$page"
        "&api_key=$_apikey";

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
