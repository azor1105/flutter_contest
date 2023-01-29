import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  @JsonKey(defaultValue: "", name: "cardId")
  final String cardId;

  @JsonKey(defaultValue: [], name: "gradient")
  final List<String> gradient;

  @JsonKey(defaultValue: "", name: "card_number")
  final String cardNumber;

  @JsonKey(defaultValue: "", name: "card_name")
  final String cardName;

  @JsonKey(defaultValue: "", name: "money_amount")
  final String moneyAmount;

  @JsonKey(defaultValue: "", name: "owner")
  final String owner;

  @JsonKey(name: "expire_date")
  final DateTime expireDate;

  @JsonKey(defaultValue: "", name: "icon_image")
  final String iconImage;

  @JsonKey(defaultValue: "", name: "user_id")
  final String userId;

  CardModel({
    required this.cardId,
    required this.gradient,
    required this.cardNumber,
    required this.cardName,
    required this.moneyAmount,
    required this.owner,
    required this.expireDate,
    required this.iconImage,
    required this.userId,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
