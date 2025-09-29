
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
class CurrencyModel extends Equatable {
  const CurrencyModel({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory CurrencyModel.fromJson(Map<String, dynamic> json) =>
      _$CurrencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);

  final String code;
  final String name;
  final String symbol;

  @override
  List<Object?> get props => [code, name, symbol];
}
