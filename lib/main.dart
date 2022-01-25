import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/env/flavor.dart';
import 'package:restaurant_app/core/di/injection.dart' as di;
import 'package:restaurant_app/presentation/app/app.dart';
import 'package:restaurant_app/presentation/app/app_bloc_observer.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (details) {
        log(details.exceptionAsString(),
            stackTrace: details.stack, name: 'ERROR');
      };
      FlavorSettings.development();
      await di.init();
      await disableLandscapeMode();

      BlocOverrides.runZoned(
        () => runApp(const App()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) {
      log(error.toString(), stackTrace: stackTrace);
    },
  );
}

Future<void> disableLandscapeMode() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
