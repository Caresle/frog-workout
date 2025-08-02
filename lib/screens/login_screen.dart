import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workouts_app/config/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: size.width - 16,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Frog Workouts',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const Text('Login to start'),
                          const SizedBox(height: 16),
                          Container(
                            width: (size.width - 32) * .25,
                            height: (size.width - 32) * .25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.blueGrey,
                            ),
                            child: Icon(Icons.pets_rounded, size: 48),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Username'),
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Password'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: size.width - 32,
                            child: FilledButton(
                              style: AppStyle.filledPrimaryBorderSm,
                              onPressed: () {
                                context.go('/');
                              },
                              child: const Text('Login'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
