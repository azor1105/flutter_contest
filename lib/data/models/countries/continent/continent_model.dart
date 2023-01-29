import 'package:json_annotation/json_annotation.dart';

part 'continent_model.g.dart';

@JsonSerializable()
class ContinentModel {
  @JsonKey(defaultValue: "", name: "code")
  final String code;

  @JsonKey(defaultValue: "", name: "name")
  final String name;

  
  ContinentModel({required this.code, required this.name,});

  factory ContinentModel.fromJson(Map<String, dynamic> json) {
    return _$ContinentModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContinentModelToJson(this);
}
