import 'package:json_annotation/json_annotation.dart';

part 'dog_api_result.g.dart';

@JsonSerializable()
class DogApiResult {
  Map<String, List<String>> message;
  String status;

  DogApiResult({required this.message, required this.status});
}
