import 'package:pick_your_dog/features/dashboard/data/dog_image_result.dart';

abstract class IDogRepository {
  Future<Map<String, List<String>?>> getBreedsAndSubBreedsList();
  Future<DogImageResult>? getRandomDogByBreed(String breed);
}
