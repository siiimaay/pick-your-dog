import 'package:flutter/material.dart';
import 'package:pick_your_dog/features/dashboard/presentation/common_widgets/card_button.dart';

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
      home: MyHomePage(
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
        padding: EdgeInsets.only(top: 280),
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          childAspectRatio: 0.8,
          crossAxisSpacing: 15,
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: List.generate(
              4,
              (index) => CardButton(
                    content: "Hey",
                    onPressed: () {},
                  )),
        ),
      ),
    );
  }
}
