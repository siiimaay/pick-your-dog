import 'package:json_annotation/json_annotation.dart';

part 'dog_list_image_result.g.dart';

@JsonSerializable()
class DogListImageResult {
  final List<String> message;
  final String status;

  DogListImageResult({required this.message, required this.status});

  factory DogListImageResult.fromJson(Map<String, dynamic> json) =>
      _$DogListImageResultFromJson(json);

  Map<String, dynamic> toJson() => _$DogListImageResultToJson(this);
}
