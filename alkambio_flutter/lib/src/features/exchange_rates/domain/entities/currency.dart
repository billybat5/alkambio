
import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
  });

  final String code;
  final String name;
  final String symbol;

  @override
  List<Object?> get props => [code, name, symbol];
}
