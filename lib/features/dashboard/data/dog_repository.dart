import 'package:pick_your_dog/features/dashboard/data/dog_image_result.dart';

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
  Future<DogImageResult>? getRandomDogByBreed(String breed) {
    return apiService.getDogByRandomImage(breed);
  }
}
