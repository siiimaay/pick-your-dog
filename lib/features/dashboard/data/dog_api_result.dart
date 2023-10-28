import 'package:json_annotation/json_annotation.dart';

part 'dog_api_result.g.dart';

@JsonSerializable()
class BreedListResult {
  Map<String, List<String>> message;
  String status;

  BreedListResult({required this.message, required this.status});

  factory BreedListResult.fromJson(Map<String, dynamic> json) =>
      _$BreedListResultFromJson(json);

  Map<String, dynamic> toJson() => _$BreedListResultToJson(this);
}
