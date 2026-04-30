import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_signin/layers/data/data_sources/auth_remote_data_source.dart';
import 'package:google_signin/layers/data/repositories/auth_repository_impl.dart';
import 'package:google_signin/layers/domain/repositories/auth_repository.dart';
import 'package:google_signin/layers/domain/usecases/google_sign_in_use_case.dart';
import 'package:google_signin/layers/presentation/home_screen/screen/home_screen.dart';
import 'package:google_signin/layers/presentation/login_screen/provider/auth_provider.dart';
import 'package:google_signin/layers/presentation/login_screen/screen/login_screen.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(
          create: (_) => AuthRepositoryImpl(
            AuthRemoteDataSource(FirebaseAuth.instance, GoogleSignIn.instance),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              AuthProvider(GoogleSignInUseCase(context.read<AuthRepository>())),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clean Auth App',
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          return const HomeScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
