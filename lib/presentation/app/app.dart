import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/core/configs/theme/styles.dart';
import 'package:restaurant_app/data/api/favorite_provider.dart';
import 'package:restaurant_app/presentation/auth/pages/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoriteProvider(),
      child: MaterialApp(
        title: 'Restaurant App',
        theme: ThemeData(
          colorScheme: myColorSchemeLight,
          textTheme: myTextTheme,
        ),
        darkTheme: ThemeData(
          colorScheme: myColorSchemeDark,
          textTheme: myTextTheme,
        ),
        home: const LoginPage(),
      ),
    );
  }
}
