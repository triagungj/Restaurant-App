import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:restaurant_app/data/auth/models/models.dart';
import 'package:restaurant_app/presentation/auth/blocs/auth_bloc.dart';
import 'package:restaurant_app/presentation/auth/widgets/login_form.dart';
import 'package:restaurant_app/presentation/auth/widgets/login_head.dart';
import 'package:restaurant_app/presentation/home/home_page.dart';

class LoginPageContent extends StatefulWidget {
  const LoginPageContent({Key? key, required this.authBloc}) : super(key: key);

  final AuthBloc authBloc;

  @override
  State<LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<LoginPageContent> {
  final _formLoginKey = GlobalKey<FormState>();
  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void onLogin() {
    if (_formLoginKey.currentState!.validate()) {
      _formLoginKey.currentState!.save();

      final body = LoginBody(
        username: usernameController.text,
        password: passwordController.text,
      );

      widget.authBloc.add(LoginEvent(body));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        Loader.show(context,
            progressIndicator: const LinearProgressIndicator());
        Future.delayed(const Duration(milliseconds: 2000), () {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 1),
              content: Text("Login Failed"),
            ));
          }

          if (state is AuthSuccess) {
            log('login successed');
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              duration: Duration(seconds: 1),
              content: Text("Login Successed"),
            ));

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          }
          Loader.hide();
        });
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: customConstraints(),
            decoration: customDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 8, child: LoginHead()),
                Expanded(
                  flex: 8,
                  child: LoginForm(
                    usernameController: usernameController,
                    passwordController: passwordController,
                    onLogin: onLogin,
                    formKey: _formLoginKey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BoxDecoration customDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Theme.of(context).colorScheme.secondaryVariant,
          Theme.of(context).colorScheme.primaryVariant
        ],
        begin: Alignment.topRight,
        end: Alignment.topLeft,
      ),
    );
  }

  BoxConstraints customConstraints() {
    return BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height,
      maxWidth: MediaQuery.of(context).size.width,
    );
  }
}
