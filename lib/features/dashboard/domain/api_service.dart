import 'package:dio/dio.dart';
import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_breeds_result.dart';
import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_image_result.dart';
import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_list_image_result.dart';

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

  Future<DogRandomImageResult>? getDogByRandomImage(String breed) async {
    final response = await dio?.get('/breed/$breed/images/random');
    return DogRandomImageResult.fromJson(response?.data);
  }

  Future<DogRandomImageResult>? getRandomSubBreedImage(
      String breed, String subBreed) async {
    final response = await dio?.get('/breed/$breed/images/random');
    return DogRandomImageResult.fromJson(response?.data);
  }

  Future<DogListImageResult>? getDogListByBreed(String breed) async {
    final response = await dio?.get('/breed/$breed/images');
    return DogListImageResult.fromJson(response?.data);
  }

  Future<DogListImageResult>? getDogListBySubBreed(
      String breed, String subBreed) async {
    final response = await dio?.get('/breed/$breed/$subBreed/images');
    return DogListImageResult.fromJson(response?.data);
  }
}
