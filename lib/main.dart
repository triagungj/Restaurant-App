import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/presentation/app/app.dart';
import 'package:restaurant_app/presentation/app/app_bloc_observer.dart';

void main() {
  runZonedGuarded(
    () async {
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
