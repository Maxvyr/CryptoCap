import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String name; // BTC
  final String fullName; // Bitcoin
  final double price; // $10000
  final String imageURL; // logo BTC
  final double changePct24h; // +6.25%
  final double changePct1h; // +6.25%
  final double volume24h; // $11245592.32
  final double marketCapCrypto; // $161299781696.08
  final double availableSupply; // 18001162
  final double open24HourValue; // 9786.31
  final double open1HourValue; // 9981.56

  const Coin({
    @required this.name,
    @required this.fullName,
    @required this.price,
    @required this.imageURL,
    @required this.changePct24h,
    this.changePct1h,
    this.volume24h,
    this.marketCapCrypto,
    this.availableSupply,
    this.open24HourValue,
    this.open1HourValue,
  });

  @override
  List<Object> get props => [
        name,
        fullName,
        price,
        imageURL,
        changePct24h,
        changePct1h,
        volume24h,
        marketCapCrypto,
        availableSupply,
        open24HourValue,
        open1HourValue,
      ];

  @override
  String toString() =>
      "Coin {name : $name, fullName : $fullName, price : $price, imageURL: $imageURL, changePct24h : $changePct24h, changePct1h : $changePct1h, volume24h : $volume24h, marketCapCrypto : $marketCapCrypto, availableSupply : $availableSupply, open24HourValue : $open24HourValue, open1HourValue : $open1HourValue}";

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['CoinInfo']['Name'] as String,
      fullName: json['CoinInfo']['FullName'] as String,
      price: (json['RAW']['USD']['PRICE'] as num).toDouble(),
      imageURL: json['DISPLAY']['USD']['IMAGEURL'] as String,
      changePct24h: (json['RAW']['USD']['CHANGEPCT24HOUR'] as num).toDouble(),
      changePct1h: (json['RAW']['USD']['CHANGEPCTHOUR'] as num).toDouble(),
      volume24h: (json['RAW']['USD']['VOLUME24HOUR'] as num).toDouble(),
      marketCapCrypto: (json['RAW']['USD']['MKTCAP'] as num).toDouble(),
      availableSupply: (json['RAW']['USD']['SUPPLY'] as num).toDouble(),
      open24HourValue: (json['RAW']['USD']['OPEN24HOUR'] as num).toDouble(),
      open1HourValue: (json['RAW']['USD']['OPENHOUR'] as num).toDouble(),
    );
  }
}
