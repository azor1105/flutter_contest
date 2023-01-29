import 'package:json_annotation/json_annotation.dart';

import 'continent/continent_model.dart';

part 'countries_model.g.dart';

@JsonSerializable()
class CountriesModel {
  @JsonKey(defaultValue: "", name: "code")
  final String countryCode;

  @JsonKey(defaultValue: "", name: "name")
  final String name;

  @JsonKey(defaultValue: "", name: "capital")
  final String capital;

  @JsonKey(defaultValue: "", name: "currency")
  final String currency;

  @JsonKey(defaultValue: "", name: "phone")
  final String phone;

  @JsonKey(defaultValue: "", name: "emoji")
  final String emoji;

  @JsonKey(name: "continent")
  final ContinentModel continent;

  CountriesModel({
    required this.countryCode,
    required this.name,
    required this.capital,
    required this.currency,
    required this.phone,
    required this.continent,
    required this.emoji,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) {
    return _$CountriesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CountriesModelToJson(this);
}
