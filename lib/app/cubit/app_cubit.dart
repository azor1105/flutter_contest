import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  late StreamSubscription<ConnectivityResult> _streamSubscriptionConnectivity;
  final Connectivity _connectivity = Connectivity();

  void checkInternet() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((event) {
      emit(state.copyWith(result: event));
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    emit(state.copyWith(result: result));
  }

  @override
  Future<void> close() {
    _streamSubscriptionConnectivity.cancel();
    return super.close();
  }
}
