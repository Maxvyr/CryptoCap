import '../widget/coinModel.dart';

abstract class BaseCryptoRepository {
  Future<List<Coin>> getTopCoins ({int page});
  void dispose();
}