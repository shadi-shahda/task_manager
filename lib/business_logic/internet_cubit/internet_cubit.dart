import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/dependency_injection.dart' as di;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());

  Future<bool> checkConnection() async {
    final failureOrDoneMessage =
    await di.obj<InternetConnection>().hasInternetAccess;

    return await failureOrDoneMessage;
  }
}
