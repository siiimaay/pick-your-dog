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

  void updateSelectedSubBreed(String subBreed) {
    emit(state.copyWith(selectedSubreed: subBreed));
  }

  Future<void> getRandomImageByBreed() async {
    emit(state.copyWith(isLoading: true));
    final dogBreedsResult =
        await dataRepository?.getRandomDogByBreed(state.selectedBreed);
    if (dogBreedsResult != null) {
      emit(state.copyWith(
          imageList: [dogBreedsResult.message],
          hasSelectionDone: true,
          isLoading: false));
    }
  }

  Future<void> getRandomImageBySubBreed() async {
    emit(state.copyWith(isLoading: true));
    final dogBreedsResult = await dataRepository?.getRandomDogBySubBreed(
        state.selectedSubreed, state.selectedBreed);

    if (dogBreedsResult != null) {
      emit(state.copyWith(
          imageList: [dogBreedsResult.message],
          hasSelectionDone: true,
          isLoading: false));
    }
  }

  Future<void> getDogListImageByBreed() async {
    emit(state.copyWith(isLoading: true));
    final dogBreedsResult =
        await dataRepository?.getDogListByBreed(state.selectedBreed);
    if (dogBreedsResult != null) {
      emit(state.copyWith(
          imageList: dogBreedsResult.message,
          hasSelectionDone: true,
          isLoading: false));
    }
  }

  Future<void> getDogListBySubBreed() async {
    if (state.subBreedList.isNotEmpty) {
      emit(state.copyWith(isLoading: true));
      final dogBreedsResult = await dataRepository?.getDogListBySubBreed(
          state.selectedBreed, state.selectedSubreed);

      if (dogBreedsResult != null) {
        emit(state.copyWith(
            imageList: dogBreedsResult.message,
            hasSelectionDone: true,
            isLoading: false));
      }
    } else {
      emit(state.copyWith(hasError: true));
    }
  }
}

final class DogImageGeneratorState {
  final List<String> breedList;
  final bool isLoading;
  final String selectedBreed;
  final String selectedSubreed;
  final List<String> subBreedList;
  final List<String> imageList;
  final bool hasSelectionDone;
  final bool hasError;

  DogImageGeneratorState({
    this.breedList = const [],
    this.isLoading = false,
    this.selectedBreed = "",
    this.subBreedList = const [],
    this.imageList = const [],
    this.hasSelectionDone = false,
    this.selectedSubreed = "",
    this.hasError = false,
  });

  DogImageGeneratorState copyWith({
    List<String>? breedList,
    bool? isLoading,
    List<String>? subBreedList,
    String? selectedBreed,
    List<String>? imageList,
    bool? hasSelectionDone,
    String? selectedSubreed,
    bool? hasError,
  }) {
    return DogImageGeneratorState(
      breedList: breedList ?? this.breedList,
      isLoading: isLoading ?? false,
      subBreedList: subBreedList ?? this.subBreedList,
      selectedBreed: selectedBreed ?? this.selectedBreed,
      imageList: imageList ?? this.imageList,
      hasSelectionDone: hasSelectionDone ?? this.hasSelectionDone,
      selectedSubreed: selectedSubreed ?? this.selectedSubreed,
      hasError: hasError ?? this.hasError,
    );
  }
}
