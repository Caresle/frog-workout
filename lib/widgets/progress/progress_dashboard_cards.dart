import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/domain/domain.dart';

final List<DashboardCardEntity> dashboardCards = [
  DashboardCardEntity(
    icon: Icons.pie_chart_rounded,
    title: 'Statistics',
    path: '/progress/statistics',
  ),
  DashboardCardEntity(
    icon: Icons.person_rounded,
    title: 'Measures',
    path: '/progress/measures',
  ),
  DashboardCardEntity(
    icon: Icons.calendar_month_rounded,
    title: 'Calendar',
    path: '/progress/calendar',
  ),
];

class ProgressDashboardCards extends StatelessWidget {
  const ProgressDashboardCards({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width - 16,
      height: 200,
      child: ListView.builder(
        itemCount: dashboardCards.length,
        itemBuilder: (context, index) {
          final dashboardCard = dashboardCards[index];
          return _DashboardCard(dashboardCard: dashboardCard);
        },
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final DashboardCardEntity dashboardCard;

  const _DashboardCard({required this.dashboardCard});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () => context.push(dashboardCard.path),
        title: Row(
          children: [
            Icon(dashboardCard.icon),
            const SizedBox(width: 8),
            Text(dashboardCard.title),
          ],
        ),
      ),
    );
  }
}
