import '../domain/api_service.dart';
import 'I_dog_repository.dart';

class DogBreedsRepository implements IDogRepository {
  final ApiService apiService;

  DogBreedsRepository({required this.apiService});

  @override
  Future<Map<String, List<String>>>? getBreedsAndSubBreedsList() {
    return apiService.getBreedsAndSubBreedsList();
  }
}
