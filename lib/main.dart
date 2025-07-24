import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/app_router.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/providers/providers.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) {
          return ExerciseProvider(
            ExerciseRepositoryImpl(ExerciseLocalDsImpl()),
          );
        },
      ),
    ],
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Frog Workouts',
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
    );
  }
}
