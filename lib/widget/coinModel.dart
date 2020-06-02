import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coin extends Equatable {
  final String name; //example BTC
  final String fullName; // example Bitcoin
  final double price; // example $10000
  final String imageURL;  // logo BTC
  final double changePct24h; // +6.25%

  const Coin({
    @required this.name,
    @required this.fullName,
    @required this.price,
    @required this.imageURL,
    @required this.changePct24h
  });

  @override
  List<Object> get props =>
      [
        name,
        fullName,
        price,
        imageURL,
        changePct24h,
      ];

  @override
  String toString() =>
      "Coin {name : $name, fullName : $fullName, price : $price, imageURL: $imageURL, changePct24h : $changePct24h}";

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['CoinInfo']['Name'] as String,
      fullName: json['CoinInfo']['FullName'] as String,
      price: (json['RAW']['USD']['PRICE'] as num).toDouble(),
      imageURL: json['DISPLAY']['USD']['IMAGEURL'] as String,
      changePct24h: (json['RAW']['USD']['CHANGEPCT24HOUR'] as num).toDouble(),
    );
  }
}
