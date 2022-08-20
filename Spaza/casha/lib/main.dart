import 'package:casha/casha_app.dart';
import 'package:flutter/material.dart';
import 'package:casha/ui/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:casha/auth/auth_repository.dart';

void main() {
  runApp(CashaApp());
}

class CashaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
          create: (context) => AuthRepository(),
          child: LoginView(),
      ),
    );
  }
}