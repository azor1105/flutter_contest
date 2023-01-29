// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      cardId: json['cardId'] as String? ?? '',
      gradient: (json['gradient'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      cardNumber: json['card_number'] as String? ?? '',
      cardName: json['card_name'] as String? ?? '',
      moneyAmount: json['money_amount'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
      expireDate: DateTime.parse(json['expire_date'] as String),
      iconImage: json['icon_image'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'cardId': instance.cardId,
      'gradient': instance.gradient,
      'card_number': instance.cardNumber,
      'card_name': instance.cardName,
      'money_amount': instance.moneyAmount,
      'owner': instance.owner,
      'expire_date': instance.expireDate.toIso8601String(),
      'icon_image': instance.iconImage,
      'user_id': instance.userId,
    };
