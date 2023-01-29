import 'dart:ui';
import 'package:flutter_contest/presentation/utils/extensions/color_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'card_model.g.dart';

@JsonSerializable()
class CardModel {
  @JsonKey(defaultValue: "", name: "card_id")
  final String cardId;

  @JsonKey(defaultValue: [], name: "gradient")
  final List<Color> gradient;

  @JsonKey(defaultValue: "", name: "card_number")
  final String cardNumber;

  @JsonKey(defaultValue: "", name: "card_name")
  final String cardName;

  @JsonKey(defaultValue: "", name: "money_amount")
  final String moneyAmount;

  @JsonKey(defaultValue: "", name: "owner")
  final String owner;

  @JsonKey(defaultValue: "", name: "expire_date")
  final String expireDate;

  @JsonKey(defaultValue: "", name: "icon_image")
  final String iconImage;

  @JsonKey(defaultValue: "", name: "user_id")
  final String userId;

  @JsonKey(defaultValue: "", name: "card_type")
  final String cardType;

  @JsonKey(defaultValue: 0, name: "index")
  final int index;

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
    required this.cardType,
    required this.index,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}