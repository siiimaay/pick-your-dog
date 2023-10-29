import 'package:dio/dio.dart';
import 'package:pick_your_dog/features/dashboard/data/dog_breeds_result.dart';
import 'package:pick_your_dog/features/dashboard/data/dog_image_result.dart';

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
    final responseData = BreedResult.fromJson(response?.data);
    final data = responseData.message;

    return data;
  }

  Future<DogImageResult>? getDogByRandomImage(String breed) async {
    print(breed);
    final response = await dio?.get('/breed/$breed/images/random');
    return DogImageResult.fromJson(response?.data);
  }
}
