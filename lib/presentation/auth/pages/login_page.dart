import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/di/injection.dart';
import 'package:restaurant_app/presentation/auth/blocs/auth_bloc.dart';
import 'package:restaurant_app/presentation/auth/contents/login_page_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = sl<AuthBloc>();

    return Scaffold(
      body: BlocProvider(
        create: (create) => authBloc,
        child: LoginPageContent(authBloc: authBloc),
      ),
    );
  }
}
