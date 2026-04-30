import 'package:flutter/material.dart';
import 'package:google_signin/layers/domain/repositories/auth_repository.dart';
import 'package:google_signin/layers/presentation/login_screen/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.user;
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: user == null
            ? const Text("No user data available")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 80),
                  const SizedBox(height: 20),
                  Text("Welcome,", style: TextStyle(fontSize: 18)),

                  const SizedBox(height: 8),

                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    user.email,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),

                  const SizedBox(height: 30),

                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await context.read<AuthRepository>().signOut();
                      },
                      child: const Text('Sign Out'),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
