import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final initialized = await DbHandler().init();
  if (!initialized) {
    throw Exception('Failed to initialize database');
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return AuthProvider(
              AuthRepositoryImpl(
                local: AuthLocalDsImpl(),
                remote: AuthRemoteDsImpl(),
              ),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) =>
              RecordProvider(RecordRepositoryImpl(RecordSqfliteDs())),
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ExerciseProvider(
              ExerciseRepositoryImpl(ExerciseSqfliteDs()),
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return WorkoutsProvider(WorkoutRepositoryImpl(WorkoutsSqfliteDs()));
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

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
