import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_image_result.dart';
import 'package:pick_your_dog/features/dashboard/data/api_results_model/dog_list_image_result.dart';

import '../domain/api_service.dart';
import 'I_dog_repository.dart';

class DogBreedsRepository implements IDogRepository {
  final ApiService apiService;

  DogBreedsRepository({required this.apiService});

  @override
  Future<Map<String, List<String>?>> getBreedsAndSubBreedsList() {
    return apiService.getBreedsAndSubBreedsList();
  }

  @override
  Future<DogRandomImageResult>? getRandomDogByBreed(String breed) {
    return apiService.getDogByRandomImage(breed);
  }

  @override
  Future<DogListImageResult>? getDogListByBreed(String breed) {
    return apiService.getDogListByBreed(breed);
  }

  @override
  Future<DogRandomImageResult>? getRandomDogBySubBreed(
      String subBreed, String breed) {
    return apiService.getRandomSubBreedImage(breed, subBreed);
  }

  @override
  Future<DogListImageResult>? getDogListBySubBreed(
      String breed, String subBreed) {
    return apiService.getDogListBySubBreed(breed, subBreed);
  }
}
