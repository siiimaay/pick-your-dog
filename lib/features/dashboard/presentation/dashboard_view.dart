import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_your_dog/features/dashboard/domain/dog_image_generator_cubit.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/card_button.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/dropdown.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/submit_button.dart';
import 'package:pick_your_dog/features/dashboard/presentation/image_view/image_view.dart';

import 'image_view/header_wave_shape.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
              clipper: BackgroundWaveClipper(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color(0xFFD1C4E9),
                    Color(0xFFBBDEFB), //
                  ],
                )),
                child: Center(
                    child: Text("Welcome to dog world!\n",
                        style: TextStyle(
                          color: const Color(0xff36454f).withOpacity(0.7),
                          fontFamily: 'Inter',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ))),
              )),
          Expanded(
            child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 15,
                  children: [
                    CardButton(
                        key: const Key(
                          "card_key",
                        ),
                        content: "Get dog by breed!",
                        onPressed: (context) {
                          showBottomSheet(
                              context: context,
                              onAction: (ctx) {
                                _cubit(ctx).getRandomImageByBreed();
                              });
                        }),
                    CardButton(
                      content: "Get dog list by breed!",
                      onPressed: (context) {
                        showBottomSheet(
                            context: context,
                            onAction: (ctx) {
                              _cubit(ctx).getDogListImageByBreed();
                            });
                      },
                    ),
                    CardButton(
                      content: "Get dog by sub breed",
                      onPressed: (ctx) {
                        showBottomSheet(
                            context: context,
                            hasSubBreedRequired: true,
                            onAction: (ctx) {
                              _cubit(ctx).getRandomImageBySubBreed();
                            });
                      },
                    ),
                    CardButton(
                      content: "Get dog list by sub breed",
                      onPressed: (context) {
                        showBottomSheet(
                            context: context,
                            hasSubBreedRequired: true,
                            onAction: (ctx) {
                              _cubit(ctx).getDogListBySubBreed();
                            });
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

void showBottomSheet({
  required BuildContext context,
  Function(BuildContext)? onAction,
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
              child: Builder(builder: (context) {
                return ImageGenerationBlocBuilder(
                  onAction: (context) {
                    onAction!(context);
                  },
                  hasSubBreedRequired: hasSubBreedRequired,
                );
              }),
            )),
      );
    },
  );
}

class ImageGenerationBlocBuilder extends StatelessWidget {
  final Function(BuildContext) onAction;
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
      return AnimatedSwitcher(
          duration: const Duration(milliseconds: 1000),
          switchInCurve: Curves.bounceInOut,
          child: !state.hasSelectionDone
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text("Generate Image",
                          style: TextStyle(
                            color: Color(0xff36454f).withOpacity(0.9),
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      child: Text("Choose breed",
                          style: TextStyle(
                            color: Color(0xff36454f).withOpacity(0.7),
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Flexible(
                      child: Dropdown(
                          key: const Key("dropdown_key"),
                          items: breeds,
                          hint: "Pick breed",
                          onItemSelect: (String value) =>
                              _cubit(context).getSubBreedByBreed(value)),
                    ),
                    if (state.subBreedList.isNotEmpty &&
                        hasSubBreedRequired) ...[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        child: Text("Choose breed",
                            style: TextStyle(
                              color: Color(0xff36454f).withOpacity(0.7),
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                      Flexible(
                        child: Dropdown(
                          items: subBreeds,
                          hint: "Pick Sub Breed",
                          onItemSelect: (String value) =>
                              _cubit(context).updateSelectedSubBreed(value),
                        ),
                      ),
                    ],
                    const Spacer(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: SubmitButton(
                          key: const Key("submit_button_key"),
                          buttonText: 'Generate Image!',
                          onPressed: () => onAction(context),
                          color: Colors.deepPurpleAccent.shade200,
                        ),
                      ),
                    )
                  ],
                )
              : ImageView(imageList: state.imageList));
    });
  }
}

DogImageGeneratorCubit _cubit(BuildContext context) =>
    BlocProvider.of<DogImageGeneratorCubit>(context);
