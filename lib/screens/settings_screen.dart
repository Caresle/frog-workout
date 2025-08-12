import 'package:flutter/material.dart';
import 'package:workouts_app/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownMenu(
                label: const Text('Default unit'),
                width: size.width - 16,
                initialSelection: 'Kg',
                onSelected: (value) {
                  if (value == null) return;
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'Kg', label: 'Kg'),
                  DropdownMenuEntry(value: 'Lbs', label: 'Lbs'),
                ],
              ),
              const SizedBox(height: 16),
              DropdownMenu(
                label: const Text('Language'),
                width: size.width - 16,
                initialSelection: 'Spanish',
                onSelected: (value) {
                  if (value == null) return;
                },
                dropdownMenuEntries: [
                  DropdownMenuEntry(value: 'Spanish', label: 'Spanish'),
                  DropdownMenuEntry(value: 'English', label: 'English'),
                ],
              ),
              const SizedBox(height: 16),
              ThemeSwitcher(),
              Row(
                children: [
                  Icon(Icons.timer_rounded),
                  const SizedBox(width: 8),
                  Text('Timer sound'),
                  const Spacer(),
                  Switch(value: true, onChanged: (value) {}),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: size.width - 16,
                child: FilledButton.tonalIcon(
                  onPressed: () {},
                  icon: Icon(Icons.ios_share_rounded),
                  label: Text('Export data'),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: size.width - 16,
                child: FilledButton.tonalIcon(
                  onPressed: () {},
                  icon: Icon(Icons.help_rounded),
                  label: Text('Export Help'),
                ),
              ),
              const SizedBox(height: 8),
              SyncButton(),
            ],
          ),
        ),
      ),
    );
  }
}
