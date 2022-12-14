import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:oh_my_cat/app/app.dart';
import 'package:oh_my_cat/app/app_bloc_observer.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
