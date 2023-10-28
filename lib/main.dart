import 'package:flutter/material.dart';
import 'package:pick_your_dog/features/dashboard/presentation/dashboard_view.dart';

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
        initialRoute: "/dashboard",
        routes: {
          "/dashboard": (context) => const DashboardView(),
        });
  }
}
