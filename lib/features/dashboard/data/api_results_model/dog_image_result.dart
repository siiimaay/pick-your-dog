import 'package:json_annotation/json_annotation.dart';

part 'dog_image_result.g.dart';

@JsonSerializable()
class DogRandomImageResult {
  final String message;
  final String status;

  DogRandomImageResult({required this.message, required this.status});

  factory DogRandomImageResult.fromJson(Map<String, dynamic> json) =>
      _$DogRandomImageResultFromJson(json);

  Map<String, dynamic> toJson() => _$DogRandomImageResultToJson(this);
}
