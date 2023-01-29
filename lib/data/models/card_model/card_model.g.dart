// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      cardId: json['card_id'] as String? ?? '',
      gradient: (json['gradient'] as List?)
              ?.map((e) => HexColor.fromHex(e as String))
              .toList() ??
          [],
      cardNumber: json['card_number'] as String? ?? '',
      cardName: json['card_name'] as String? ?? '',
      moneyAmount: json['money_amount'] as String? ?? '',
      owner: json['owner'] as String? ?? '',
      expireDate: json['expire_date'] as String? ?? '',
      iconImage: json['icon_image'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      cardType: json['card_type'] as String? ?? '',
      index: json['index'] as int? ?? 0,
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'card_id': instance.cardId,
      'gradient': instance.gradient.map((e) => e.toHex()).toList(),
      'card_number': instance.cardNumber,
      'card_name': instance.cardName,
      'money_amount': instance.moneyAmount,
      'owner': instance.owner,
      'expire_date': instance.expireDate,
      'icon_image': instance.iconImage,
      'user_id': instance.userId,
      'card_type': instance.cardType,
      'index': instance.index,
    };
