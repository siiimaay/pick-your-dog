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
      emit(state.copyWith(
          breedList: dogBreedsResult.keys.toList(), isLoading: false));
    }
  }

  Future<void> getSubBreedByBreed(String breed) async {
    emit(state.copyWith(isLoading: true));
    final dogBreedsResult = await dataRepository?.getBreedsAndSubBreedsList();
    if (dogBreedsResult != null) {
      emit(state.copyWith(
        selectedBreed: breed,
        subBreedList: dogBreedsResult[breed],
        isLoading: false,
      ));
    }
  }

  Future<void> getRandomImageByBreed() async {
    print("here");
    emit(state.copyWith(isLoading: true));
    final dogBreedsResult =
        await dataRepository?.getRandomDogByBreed(state.selectedBreed);
    print(dogBreedsResult);
    if (dogBreedsResult != null) {
      print(dogBreedsResult.message);
      emit(state.copyWith(
          imageList: [dogBreedsResult.message],
          hasSelectionDone: true,
          isLoading: false));
    }
  }
}

final class DogImageGeneratorState {
  final List<String> breedList;
  final bool isLoading;
  final String selectedBreed;
  final List<String> subBreedList;
  final List<String> imageList;
  final bool hasSelectionDone;

  DogImageGeneratorState({
    this.breedList = const [],
    this.isLoading = false,
    this.selectedBreed = "",
    this.subBreedList = const [],
    this.imageList = const [],
    this.hasSelectionDone = false,
  });

  DogImageGeneratorState copyWith({
    List<String>? breedList,
    bool? isLoading,
    List<String>? subBreedList,
    String? selectedBreed,
    List<String>? imageList,
    bool? hasSelectionDone,
  }) {
    return DogImageGeneratorState(
      breedList: breedList ?? this.breedList,
      isLoading: isLoading ?? false,
      subBreedList: subBreedList ?? this.subBreedList,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      imageList: imageList ?? this.imageList,
      hasSelectionDone: hasSelectionDone ?? this.hasSelectionDone,
    );
  }
}
