import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workouts_app/config/config.dart';
import 'package:workouts_app/data/data.dart';
import 'package:workouts_app/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Environment.initEnvironment();
  await SupabaseHandler.init();

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
        ChangeNotifierProvider(
          create: (_) => SyncProvider(SyncRepositoryImpl(SyncSupabaseDs())),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => StatisticsProvider()),
        ChangeNotifierProvider(create: (_) => CalendarProvider()),
        ChangeNotifierProvider(
          create: (_) =>
              MeasuresProvider(MeasuresRepositoryImpl(MeasuresSqfliteDs())),
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
    final isDark = context.watch<ThemeProvider>().isDark;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Frog Workouts',
      routerConfig: appRouter,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
        useMaterial3: true,
      ),
    );
  }
}
