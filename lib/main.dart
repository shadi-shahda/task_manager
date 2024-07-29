import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/crud_todo/crud_cubit.dart';
import 'package:flutter_application_1/business_logic/internet_cubit/internet_cubit.dart';
import 'package:flutter_application_1/business_logic/todo_cubit/todo_cubit.dart';
import 'package:flutter_application_1/business_logic/user_info_cubit/user_info_cubit.dart';
import 'package:flutter_application_1/presentation/screens/auth_screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/dependency_injection.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/auth_cubit/auth_cubit.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  // await di.obj<SharedPreferences>().clear();
  runApp(const TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.obj<InternetCubit>(),
        ),
        BlocProvider(
          create: (_) => di.obj<AuthCubit>(),
        ),
        BlocProvider(
          create: (_) => di.obj<UserInfoCubit>(),
        ),
        BlocProvider(
          create: (_) => di.obj<TodoCubit>(),
        ),
        BlocProvider(
          create: (_) => di.obj<CrudCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
