import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constance/colors.dart';
import 'package:flutter_application_1/presentation/widgets/gesture_detector.dart';
import 'package:flutter_application_1/presentation/widgets/loading_indicator.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAlertDialog {
  static alertDialog(
    BuildContext context, {
    String? title,
    String? bodyContent,
    Widget? body,
    String? firstButton,
    firstPressed,
    String? secondButton,
    secondPressed,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height * 0.24;
        final width = MediaQuery.of(context).size.width * 0.87;
        return SizedBox(
          width: width * 0.87,
          height: height * 0.24,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            alignment: Alignment.center,
            title: Row(
              children: [
                const Icon(
                  Icons.warning,
                  color: yellow,
                ),
                const SizedBox(width: 10),
                Text(title ?? ''),
              ],
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.87,
              child: body ??
                  MyText.text(bodyContent ?? '',
                      fontSize: 14,
                      textColor: black,
                      overflow: TextOverflow.visible),
            ),
            actions: <Widget>[
              secondButton != null
                  ? _buildButton(
                      width, height, secondPressed, secondButton, primaryColor)
                  : Container(),
              firstButton != null
                  ? _buildButton(width, height, firstPressed, firstButton, red)
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  static alertDialogWithCubit<C extends StateStreamable<S>, S, L extends S,D extends S>(
    BuildContext context, {
    String? title,
    String? bodyContent,
    Widget? body,
    String? firstButton,
    firstPressed,
    String? secondButton,
    secondPressed,
    todoInListener,
    required bool firstButtonLoad,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height * 0.24;
        final width = MediaQuery.of(context).size.width * 0.87;
        return SizedBox(
          width: width * 0.87,
          height: height * 0.24,
          child: AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            alignment: Alignment.center,
            title: Row(
              children: [
                const Icon(
                  Icons.warning,
                  color: yellow,
                ),
                const SizedBox(width: 10),
                Text(title ?? ''),
              ],
            ),
            content: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.87,
              child: body ??
                  MyText.text(bodyContent ?? '',
                      fontSize: 14,
                      textColor: black,
                      overflow: TextOverflow.visible),
            ),
            actions: <Widget>[
              secondButton != null
                  ? BlocConsumer<C, S>(
                      listener: (context, state) {
                        if(state is D){
                          todoInListener();
                        }
                      },
                      builder: (context, state) {
                        if (state is L && !firstButtonLoad) {
                          return LoadingIndicator.circularProgressIndicator(
                              color: yellow);
                        }
                        return _buildButton(width, height, secondPressed,
                            secondButton, primaryColor);
                      },
                    )
                  : Container(),
              firstButton != null
                  ? BlocConsumer<C, S>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is L  && firstButtonLoad) {
                          return Center(
                            child: LoadingIndicator.circularProgressIndicator(
                                color: white),
                          );
                        }
                        return _buildButton(
                            width, height, firstPressed, firstButton, red);
                      },
                    )
                  : Container(),
            ],
          ),
        );
      },
    );
  }

  static _buildButton(
    double width,
    double height,
    secondPressed,
    String? content,
    Color color,
  ) {
    return MyGestureDetector.gestureDetector(
      onTap: secondPressed,
      child: Container(
        width: width * 0.32,
        height: height * 0.22,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: MyText.text(content ?? '', textColor: white, fontSize: 14),
        ),
      ),
    );
  }
}
