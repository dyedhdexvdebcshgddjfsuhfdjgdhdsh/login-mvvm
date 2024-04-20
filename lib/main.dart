import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/firebase_options.dart';
import 'package:login_task/view_model/bloc/cubit.dart';
import 'package:login_task/views/pages/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          // options: const FirebaseOptions(
          //   apiKey: "ApiKey",
          //   appId: "ApiID",
          //   messagingSenderId: "messagingSenderId",
          //   projectId: "projectId",
          options: DefaultFirebaseOptions.currentPlatform,
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => AppCubit())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
