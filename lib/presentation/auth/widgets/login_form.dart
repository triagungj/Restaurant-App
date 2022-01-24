import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.setLogin,
    required this.getLogin,
    required this.formKey,
  }) : super(key: key);
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function() setLogin;
  final Function() getLogin;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                style: TextStyle(color: Theme.of(context).primaryColor),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    hintText: "Username",
                    hintStyle: const TextStyle(color: Color(0xFF7d7d7d)),
                    prefixIcon: const Icon(
                      Icons.account_box,
                      color: Color(0xFF000000),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else if (value.length < 6) {
                    return "Username should be atleast 6 characters";
                  } else if (value.length > 24) {
                    return "Username should not be greater than 24";
                  }
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                obscureText: true,
                style: TextStyle(color: Theme.of(context).primaryColor),
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.onPrimary,
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Color(0xFF7d7d7d)),
                    prefixIcon: const Icon(
                      Icons.password,
                      color: Color(0xFF000000),
                    )),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "* Required";
                  } else if (value.length < 6) {
                    return "Password should be atleast 6 characters";
                  } else if (value.length > 24) {
                    return "Password should not be greater than 24";
                  }
                },
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      setLogin();
                      getLogin();
                    }
                  },
                  child: const Text("Log In", style: TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Forgot your login details? Click link below",
                style: TextStyle(color: Colors.white),
              ),
              const Text("Forgot Password",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white54))
            ],
          ),
        ),
      ),
    );
  }
}
