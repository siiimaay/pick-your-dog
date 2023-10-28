import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_your_dog/features/dashboard/data/I_dog_repository.dart';
import 'package:pick_your_dog/features/dashboard/domain/api_service.dart';

import '../data/dog_repository.dart';

class DogImageGeneratorCubit extends Cubit<DogImageGeneratorState> {
  late final IDogRepository? dataRepository;

  DogImageGeneratorCubit() : super(DogImageGeneratorState()) {
    dataRepository = DogBreedsRepository(apiService: ApiService());
    _init();
  }

  Future<void> _init() async {
    emit(state.copyWith(isLoading: true));
    final dogBreedsResult = await dataRepository?.getBreedsAndSubBreedsList();
    if (dogBreedsResult != null) {
      emit(state.copyWith(breedList: dogBreedsResult, isLoading: false));
    }
  }

  Future<void> getSubBreedByBreed(String breed) async {
    emit(state.copyWith(isLoading: true));

    final dogBreedsResult = await dataRepository?.getBreedsAndSubBreedsList();
    if (dogBreedsResult != null) {
      emit(state.copyWith(subBreedList: dogBreedsResult, isLoading: false));
    }
  }
}

final class DogImageGeneratorState {
  final List<String> breedList;
  final List<String> subBreedList;
  final bool isLoading;

  DogImageGeneratorState(
      {this.breedList = const [],
      this.subBreedList = const [],
      this.isLoading = false});

  DogImageGeneratorState copyWith({
    List<String>? breedList,
    List<String>? subBreedList,
    bool? isLoading,
  }) {
    return DogImageGeneratorState(
        breedList: breedList ?? this.breedList,
        subBreedList: subBreedList ?? this.subBreedList,
        isLoading: isLoading ?? false);
  }
}
