
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_model.g.dart';

@JsonSerializable()
class CountryModel extends Equatable {
  const CountryModel({
    required this.code,
    required this.name,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryModelToJson(this);

  final String code;
  final String name;
  final String flag;

  @override
  List<Object?> get props => [code, name, flag];
}
