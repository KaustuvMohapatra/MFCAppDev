import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_curios_case/providers/game_provider.dart';
import 'package:the_curios_case/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: MaterialApp(
        title: 'The Curious Case',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}