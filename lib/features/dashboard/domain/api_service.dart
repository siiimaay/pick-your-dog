import 'package:dio/dio.dart';
import 'package:pick_your_dog/features/dashboard/data/dog_api_result.dart';

class ApiService {
  final Dio? dio;
  static ApiService? _instance;

  factory ApiService() {
    final dio = Dio();
    dio.options.baseUrl = 'https://dog.ceo/api';

    return _instance ??= ApiService._(dio: dio);
  }

  ApiService._({this.dio});

  Future<Map<String, List<String>>> getBreedsAndSubBreedsList() async {
    final response = await dio?.get('/breeds/list/all');
    final responseData = BreedListResult.fromJson(response?.data);

    final data = responseData.message;

    final breedsMap = data.map<String, List<String>>((key, value) {
      final subBreeds = List<String>.from(value);
      return MapEntry<String, List<String>>(key, subBreeds);
    });
    return breedsMap;
  }
}
