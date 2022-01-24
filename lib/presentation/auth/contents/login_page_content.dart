import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:restaurant_app/presentation/auth/widgets/login_form.dart';
import 'package:restaurant_app/presentation/auth/widgets/login_head.dart';
import 'package:restaurant_app/presentation/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageContent extends StatefulWidget {
  const LoginPageContent({Key? key}) : super(key: key);

  @override
  State<LoginPageContent> createState() => _LoginPageContentState();
}

class _LoginPageContentState extends State<LoginPageContent> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _loginChecker() async {
    final SharedPreferences prefs = await _prefs;
    final bool status = prefs.getBool('login') ?? false;

    if (status == true) {
      _getLogin();
    }
  }

  Future<void> _setLogin() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool("login", true);
  }

  @override
  void initState() {
    super.initState();
    _loginChecker();
  }

  void _getLogin() {
    Loader.show(context, progressIndicator: const LinearProgressIndicator());
    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));
      Loader.hide();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                setLogin: _setLogin,
                getLogin: _getLogin,
                formKey: formKey,
              ),
            ),
          ],
        ),
      ),
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
