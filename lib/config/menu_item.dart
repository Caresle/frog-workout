import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/screens/screens.dart';

class MenuItem {
  final String name;
  final String path;
  final IconData icon;
  final Widget widgetPage;
  final bool isBottom;
  final Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder;

  const MenuItem({
    required this.name,
    required this.path,
    required this.icon,
    required this.widgetPage,
    this.isBottom = false,
    this.pageBuilder,
  });

  GoRoute getGoRoute() => GoRoute(
    path: path,
    name: name,
    builder: (context, state) => widgetPage,
    pageBuilder:
        pageBuilder ??
        (context, state) {
          return CustomTransitionPage(
            child: widgetPage,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    SlideTransition(
                      position: animation.drive(
                        Tween<Offset>(
                          begin: const Offset(0.05, 0),
                          end: Offset.zero,
                        ).chain(CurveTween(curve: Curves.easeIn)),
                      ),
                      child: child,
                    ),
          );
        },
  );
}

final appMenuItems = <MenuItem>[
  const MenuItem(
    name: 'Workouts',
    path: '/',
    icon: Icons.home_rounded,
    isBottom: true,
    widgetPage: HomeScreen(),
  ),
  const MenuItem(
    name: 'Exercises',
    path: '/exercises',
    icon: Icons.fitness_center_rounded,
    isBottom: true,
    widgetPage: ExerciseScreen(),
  ),
];

final dynamicRoutes = [
  GoRoute(
    path: '/exercises/:id',
    builder: (context, state) {
      final id = state.pathParameters['id'];
      if (id == null) {
        return const Scaffold(body: Center(child: Text('No ID found')));
      }

      return ExerciseFormScreen(id: int.parse(id));
    },
  ),
  GoRoute(
    path: '/workouts/:id',
    builder: (context, state) {
      final id = state.pathParameters['id'];
      if (id == null) {
        return const Scaffold(body: Center(child: Text('No ID found')));
      }

      return WorkoutItemScreen(id: int.parse(id));
    },
  ),
  GoRoute(
    path: '/workouts/:id/start',
    builder: (context, state) {
      final id = state.pathParameters['id'];
      if (id == null) {
        return const Scaffold(body: Center(child: Text('No ID found')));
      }

      return WorkoutDisplayScreen(id: int.parse(id));
    },
  ),
];
