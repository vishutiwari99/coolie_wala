import 'package:coolie_wala/features/auth/presentation/bloc/auth_event.dart';
import 'package:coolie_wala/features/auth/presentation/ui/screens/phone_number_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/datasources/firebase_auth_datasource.dart';
import 'data/datasources/firestore_datasource.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/usecases/authenticate_user.dart';
import 'domain/usecases/confirm_otp.dart';
import 'domain/usecases/save_address.dart';
import 'presentation/bloc/auth_bloc.dart';
// import 'presentation/ui/screens/phone_number_screen.dart';
import 'presentation/ui/screens/otp_screen.dart';
import 'presentation/ui/screens/address_screen.dart';

class AuthFeature extends StatelessWidget {
  const AuthFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseAuthDataSource = FirebaseAuthDataSource();
    final firestoreDataSource = FirestoreDataSource();

    final authRepository = AuthRepositoryImpl(
      firebaseAuthDataSource: firebaseAuthDataSource,
      firestoreDataSource: firestoreDataSource,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authenticateUser: AuthenticateUser(authRepository),
            confirmOtp: ConfirmOtp(authRepository),
            saveAddress: SaveAddress(authRepository),
          )..add(CheckAuthStatusEvent()),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const PhoneNumberScreen(),
          '/otp': (context) => OtpScreen(verificationId: ''),
          '/address': (context) => AddressScreen(),
          '/home': (context) => const HomeScreen(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const Center(child: Text('Welcome to the Home Screen')),
    );
  }
}
