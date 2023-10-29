import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_image_result.dart';
import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_list_image_result.dart';

abstract class IDogRepository {
  Future<Map<String, List<String>?>> getBreedsAndSubBreedsList();
  Future<DogRandomImageResult>? getRandomDogByBreed(String breed);
  Future<DogRandomImageResult>? getRandomDogBySubBreed(
      String subBreed, String breed);
  Future<DogListImageResult>? getDogListByBreed(String breed);
  Future<DogListImageResult>? getDogListBySubBreed(
      String breed, String subBreed);
}
