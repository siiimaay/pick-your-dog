import 'package:json_annotation/json_annotation.dart';

part 'dog_image_result.g.dart';

@JsonSerializable()
class DogImageResult {
  final String message;
  final String status;

  DogImageResult({required this.message, required this.status});

  factory DogImageResult.fromJson(Map<String, dynamic> json) =>
      _$DogImageResultFromJson(json);

  Map<String, dynamic> toJson() => _$DogImageResultToJson(this);
}
