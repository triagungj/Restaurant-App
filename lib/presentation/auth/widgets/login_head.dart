import 'package:flutter/material.dart';

class LoginHead extends StatelessWidget {
  const LoginHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            "Login",
            style: TextStyle(
                color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text("And Find Restaurants",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 24,
              ))
        ],
      ),
    );
  }
}
