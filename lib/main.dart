import 'package:flutter/material.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/card_button.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/dropdown.dart';

import 'features/dashboard/presentation/common_widgets/submit_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: "Pick your dog",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 280),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: List.generate(
              4,
              (index) => CardButton(
                    content: "Hey",
                    onPressed: () => showBottomSheet(context),
                  )),
        ),
      ),
    );
  }
}

void showBottomSheet(BuildContext context) {
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
            child: Column(
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
                    items: ["items", "items2", "items2", "items2"],
                    hint: "Pick breed",
                    onSelectedItemsChanged: (List<String> items) {},
                    selectedItems: ["items"],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                  child: Text("Choose breed"),
                ),
                Flexible(
                  child: Dropdown(
                    items: ["items", "items2", "items2", "items2"],
                    hint: "Pick breed",
                    onSelectedItemsChanged: (List<String> items) {},
                    selectedItems: ["items"],
                  ),
                ),
                Spacer(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: SubmitButton(
                      buttonText: 'Generate Image!',
                      onPressed: () {},
                      color: Colors.indigo,
                    ),
                  ),
                )
              ],
            )),
      );
    },
  );
}
