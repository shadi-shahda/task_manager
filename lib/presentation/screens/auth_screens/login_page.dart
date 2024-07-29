import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/auth_cubit/auth_cubit.dart';
import 'package:flutter_application_1/core/constance/colors.dart';
import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/functions/internet.dart';
import 'package:flutter_application_1/core/functions/navigation_functions.dart';
import 'package:flutter_application_1/core/functions/show_dialogs.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/presentation/screens/home/home_page.dart';
import 'package:flutter_application_1/presentation/widgets/buttons.dart';
import 'package:flutter_application_1/presentation/widgets/gesture_detector.dart';
import 'package:flutter_application_1/presentation/widgets/loading_indicator.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_application_1/presentation/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlue,
        title: MyText.text(loginAppBarText,
            textColor: white,
            fontSize: appBarTextSize,
            fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Container(
        height: height(context),
        width: width(context),
        color: primaryColor,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              height: height(context) / 2,
              width: width(context) * 0.9,
              decoration: BoxDecoration(
                border: Border.all(color: white),
                borderRadius: BorderRadius.circular(middleContainerRadius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText.text(loginCapitalText,
                      fontSize: loginCapitalTextSize,
                      textColor: white,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    width: width(context) * 0.64,
                    child: Column(
                      children: [
                        MyTextField.textField(
                          userNameController,
                          hint: userNameHint,
                          prefixIcon: const Icon(Icons.account_circle_outlined,
                              color: white),
                        ),
                        const SizedBox(height: 15),
                        MyTextField.textField(
                          passwordController,
                          hint: passwordHint,
                          obscure: context.read<AuthCubit>().obscurePassword,
                          prefixIcon: MyGestureDetector.gestureDetector(
                            onTap: () {
                              context.read<AuthCubit>().showLoginPassword();
                              setState(() {});
                            },
                            child: Icon(context.read<AuthCubit>().passwordIcon,
                                color: white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is LoadedState) {
                        pushingReplacementScreen(context, const HomePage());
                      } else if (state is ErrorState) {
                        errorDialog(
                          context,
                          () {
                            popScreen(context);
                          },
                          errorMessages: [
                            MyText.text(
                              state.errorMessage,
                              fontSize: 16,
                              textColor: black,
                            ),
                          ],
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return LoadingIndicator.circularProgressIndicator(color: white);
                      } else {
                        return MyButtons.primaryButton(
                          () async {
                            if (await checkInternetConnection(context)) {
                              await context.read<AuthCubit>().login(
                                  userNameController.text,
                                  passwordController.text);
                            } else {
                              errorDialog(context, () {
                                popScreen(context);
                              }, errorMessages: <Widget>[
                                MyText.text(internetIssueHappenedText,
                                    fontSize: 14, textColor: black),
                                MyText.text(pleaseTryAgainText,
                                    fontSize: 14, textColor: black),
                              ]);
                            }
                          },
                          MyText.text(
                            loginButtonText,
                            textColor: white,
                            fontSize: loginButtonTextSize,
                          ),
                          lightBlue,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
