import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lost_journal/routes.dart';
import 'package:lost_journal/theme.dart';
import 'package:lost_journal/game_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameState(),
      child: MaterialApp(
        title: 'The Curious Case of the Lost Journal',
        theme: appTheme,
        initialRoute: '/',
        routes: appRoutes,
      ),
    );
  }
}
