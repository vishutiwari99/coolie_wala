import 'package:coolie_wala/core/theme/constants.dart';
import 'package:coolie_wala/core/theme/theme.dart';
import 'package:coolie_wala/features/auth/data/datasources/auth_firebase_data_source.dart';
import 'package:coolie_wala/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:coolie_wala/features/auth/domain/usecases/user_signup.dart';
import 'package:coolie_wala/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:coolie_wala/features/auth/presentation/pages/signup_page.dart';
import 'package:coolie_wala/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (context) => AuthBloc(
              userSignup: UserSignup(AuthRepositoryImpl(
                  AuthFirebaseDataSourceImpl(firebaseAuth)))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coolie Wala',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: bodyTextColor),
            bodySmall: TextStyle(color: bodyTextColor),
          ),
          inputDecorationTheme: buildThemeData().inputDecorationTheme),
      home: const SignupPage(),
    );
  }
}
