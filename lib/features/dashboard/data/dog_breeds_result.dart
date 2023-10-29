import 'package:json_annotation/json_annotation.dart';

part 'dog_breeds_result.g.dart';

@JsonSerializable()
class BreedResult {
  final Map<String, List<String>> message;
  final String status;

  BreedResult({required this.message, required this.status});

  factory BreedResult.fromJson(Map<String, dynamic> json) =>
      _$BreedResultFromJson(json);

  Map<String, dynamic> toJson() => _$BreedResultToJson(this);
}
