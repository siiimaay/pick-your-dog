import 'package:dio/dio.dart';

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

    final data = response?.data['message'] as Map<String, dynamic>;

    final breedsMap = data.map<String, List<String>>((key, value) {
      final subBreeds = value is List ? List<String>.from(value) : <String>[];
      return MapEntry<String, List<String>>(key, subBreeds);
    });
    return breedsMap;
  }
}
