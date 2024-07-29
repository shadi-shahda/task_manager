import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/internet_cubit/internet_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<bool> checkInternetConnection(BuildContext context) async {
  if (await context.read<InternetCubit>().checkConnection()) return true;
  return false;
}