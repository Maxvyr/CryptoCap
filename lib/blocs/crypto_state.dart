import '../widget/coinModel.dart';
import 'package:equatable/equatable.dart';

abstract class CryptoState extends Equatable {
  const CryptoState();

  @override
  List<Object> get props => [];
}

// Initial State
class CryptoEmpty extends CryptoState {}

// Fetching coins
class CryptoLoading extends CryptoState {}

// Retreived coins
class CryptoLoaded extends CryptoState {
  final List<Coin> coins;

  const CryptoLoaded({this.coins});

  @override
  List<Object> get props => [coins];

  @override
  String toString() => "CryptoLoaded { coins : $coins}";
}

// API request error
class CryptoError extends CryptoState {}
