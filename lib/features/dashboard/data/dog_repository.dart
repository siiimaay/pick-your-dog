import '../domain/api_service.dart';
import 'I_dog_repository.dart';

class DogBreedsRepository implements IDogRepository {
  final ApiService apiService;

  DogBreedsRepository({required this.apiService});

  @override
  Future<List<String>>? getBreedsAndSubBreedsList() async {
    final result = await apiService.getBreedsAndSubBreedsList();
    return result.keys.toList();
  }
}
