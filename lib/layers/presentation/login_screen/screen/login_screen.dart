import 'package:flutter/material.dart';
import 'package:google_signin/layers/presentation/login_screen/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await context.read<AuthProvider>().loginWithGoogle();
          },
          child: const Text('Login With Google'),
        ),
      ),
    );
  }
}
