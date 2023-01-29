// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesModel _$CountriesModelFromJson(Map<String, dynamic> json) =>
    CountriesModel(
      countryCode: json['code'] as String? ?? '',
      name: json['name'] as String? ?? '',
      capital: json['capital'] as String? ?? '',
      currency: json['currency'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      continent:
          ContinentModel.fromJson(json['continent'] as Map<String, dynamic>),
      emoji: json['emoji'] as String? ?? '',
    );

Map<String, dynamic> _$CountriesModelToJson(CountriesModel instance) =>
    <String, dynamic>{
      'code': instance.countryCode,
      'name': instance.name,
      'capital': instance.capital,
      'currency': instance.currency,
      'phone': instance.phone,
      'emoji': instance.emoji,
      'continent': instance.continent,
    };
