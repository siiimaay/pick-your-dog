import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_your_dog/features/dashboard/domain/dog_image_generator_cubit.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/card_button.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/dropdown.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/submit_button.dart';

import '../data/card_data.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 200),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 0.8,
              crossAxisSpacing: 15,
            ),
            itemCount: cardDataList.length,
            itemBuilder: (context, index) {
              return CardButton(
                content: cardDataList[index].content,
                onPressed: (context) {
                  cardDataList[index].onPressed(context);
                },
              );
            },
          )),
    );
  }
}

List<CardData> cardDataList = [
  CardData(
      content: 'Card 1',
      onPressed: (context) {
        showBottomSheet(
          context: context,
        );
      }),
  CardData(
      content: 'Card 2',
      onPressed: (context) {
        showBottomSheet(context: context);
      }),
  CardData(
      content: 'Card 3',
      onPressed: (context) {
        showBottomSheet(context: context, hasSubBreedRequired: true);
      }),
  CardData(
      content: 'Card 4',
      onPressed: (context) {
        showBottomSheet(context: context, hasSubBreedRequired: true);
      })
];

void showBottomSheet({
  required BuildContext context,
  Function()? onAction,
  bool hasSubBreedRequired = false,
}) {
  showModalBottomSheet<void>(
    isScrollControlled: true,
    enableDrag: true,
    useSafeArea: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25.0),
    ),
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height / 1.2,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
            ),
            child: BlocProvider<DogImageGeneratorCubit>(
              create: (context) => DogImageGeneratorCubit(),
              child: ImageGenerationBlocBuilder(
                onAction: onAction,
                hasSubBreedRequired: hasSubBreedRequired,
              ),
            )),
      );
    },
  );
}

class ImageGenerationBlocBuilder extends StatelessWidget {
  final Function()? onAction;
  final bool hasSubBreedRequired;

  const ImageGenerationBlocBuilder({
    super.key,
    required this.onAction,
    this.hasSubBreedRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogImageGeneratorCubit, DogImageGeneratorState>(
        builder: (context, state) {
      final breeds = state.breedList;
      final subBreeds = state.subBreedList;
      if (state.isLoading) return Center(child: CircularProgressIndicator());
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Generate Image",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            child: Text("Choose breed"),
          ),
          Flexible(
            child: Dropdown(
                items: breeds,
                hint: "Pick breed",
                onItemSelect: (String value) =>
                    _cubit(context).getSubBreedByBreed(value)),
          ),
          if (state.subBreedList.isNotEmpty && hasSubBreedRequired) ...[
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: Text("Choose breed"),
            ),
            Flexible(
              child: Dropdown(
                items: subBreeds,
                hint: "Pick Sub Breed",
              ),
            ),
          ],
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: SubmitButton(
                buttonText: 'Generate Image!',
                onPressed: () {
                  onAction;
                  Navigator.of(context).pop();
                },
                color: Colors.indigo,
              ),
            ),
          )
        ],
      );
    });
  }
}

DogImageGeneratorCubit _cubit(BuildContext context) =>
    BlocProvider.of<DogImageGeneratorCubit>(context);
