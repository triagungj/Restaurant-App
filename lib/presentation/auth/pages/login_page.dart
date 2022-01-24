import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/auth/contents/login_page_content.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPageContent(),
    );
  }
}
