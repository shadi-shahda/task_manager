import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/crud_todo/crud_cubit.dart';
import 'package:flutter_application_1/business_logic/todo_cubit/todo_cubit.dart';
import 'package:flutter_application_1/business_logic/user_info_cubit/user_info_cubit.dart';
import 'package:flutter_application_1/core/constance/colors.dart';
import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/functions/database_functions.dart';
import 'package:flutter_application_1/core/functions/navigation_functions.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/local_storage/sql_db.dart';
import 'package:flutter_application_1/dependency_injection.dart' as di;
import 'package:flutter_application_1/presentation/screens/home/task_page.dart';
import 'package:flutter_application_1/presentation/widgets/alert_dialog.dart';
import 'package:flutter_application_1/presentation/widgets/app_bar.dart';
import 'package:flutter_application_1/presentation/widgets/floating_action_button.dart';
import 'package:flutter_application_1/presentation/widgets/gesture_detector.dart';
import 'package:flutter_application_1/presentation/widgets/loading_indicator.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_application_1/presentation/widgets/text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  bool hasMore = true;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getUser() async {
    await context.read<UserInfoCubit>().getUser();
    setState(() {});
    getTodos();
  }

  getTodos() async {
    await context.read<TodoCubit>().skipAndLimitTodo();
    controller.addListener(
      () {
        if (controller.position.maxScrollExtent == controller.offset) {
          fetchMore();
        }
      },
    );
  }

  fetchMore() async {
    int lengthHere = skipAndLimitTodoModel!.todos.length;
    await context.read<TodoCubit>().skipAndLimitTodo();
    if (lengthHere < skipAndLimitTodoModel!.todos.length - 10) {
      hasMore = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(MyText.text(homeAppBarText, textColor: white)),
      body: Container(
        height: height(context),
        width: width(context),
        color: primaryColor,
        child: getUserModel == null
            ? Center(
                child: LoadingIndicator.circularProgressIndicator(color: white),
              )
            : BlocConsumer<TodoCubit, TodoState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is TodosLoadingState &&
                      skipAndLimitTodoModel == null) {
                    return Center(
                      child: LoadingIndicator.circularProgressIndicator(
                          color: white),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: ListView.builder(
                        controller: controller,
                        shrinkWrap: true,
                        itemCount: skipAndLimitTodoModel!.todos.length + 1,
                        itemBuilder: (context, index) {
                          if (index < skipAndLimitTodoModel!.todos.length) {
                            return MyGestureDetector.gestureDetector(
                              onTap: () {
                                pushingScreen(
                                  context,
                                  PopScope(
                                    onPopInvoked: (didPop) {
                                      setState(() {});
                                    },
                                    child: TaskPage(
                                        skipAndLimitTodoModel!.todos[index].id),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                margin: const EdgeInsets.only(top: 10),
                                width: width(context) / 2 - 20,
                                height: height(context) / 8,
                                decoration: BoxDecoration(
                                    color: grey,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyText.text(
                                      skipAndLimitTodoModel!.todos[index].todo,
                                      textColor: black,
                                    ),
                                    MyText.text(
                                      'completed ? ${skipAndLimitTodoModel!.todos[index].completed}',
                                      textColor: black,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              child: Center(
                                child: hasMore
                                    ? LoadingIndicator
                                        .circularProgressIndicator(
                                        color: white,
                                      )
                                    : MyText.text(
                                        noMoreData,
                                        textColor: white,
                                      ),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  }
                },
              ),
      ),
      floatingActionButton: MyFloatingActionButton.floatingActionButton(
        onPressed: () {
          MyAlertDialog.alertDialogWithCubit<CrudCubit, CrudState,
              CreatingTodoLoadingState, TodoCreatedState>(
            firstButtonLoad: false,
            todoInListener: () {
              newTodoController.text = '';
              popScreen(context);
              setState(() {});
            },
            context,
            title: floatingActionButtonTitle,
            body: MyTextField.textField(newTodoController, textColor: black),
            firstButton: firstButtonTitle,
            firstPressed: () {
              newTodoController.text = '';
              popScreen(context);
            },
            secondButton: secondButtonTitle,
            secondPressed: () async {
              if (newTodoController.text.isNotEmpty) {
                await context
                    .read<CrudCubit>()
                    .createTodo(newTodoController.text, getUserModel!.id);
              }
            },
          );
        },
        backgroundColor: lightBlue,
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
    );
  }
}
