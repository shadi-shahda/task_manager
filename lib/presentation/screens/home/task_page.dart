import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/crud_todo/crud_cubit.dart';
import 'package:flutter_application_1/business_logic/todo_cubit/todo_cubit.dart';
import 'package:flutter_application_1/core/constance/colors.dart';
import 'package:flutter_application_1/core/constance/constance.dart';
import 'package:flutter_application_1/core/functions/internet.dart';
import 'package:flutter_application_1/core/functions/navigation_functions.dart';
import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/model/todos/get_todo_by_id.dart';
import 'package:flutter_application_1/presentation/widgets/alert_dialog.dart';
import 'package:flutter_application_1/presentation/widgets/app_bar.dart';
import 'package:flutter_application_1/presentation/widgets/gesture_detector.dart';
import 'package:flutter_application_1/presentation/widgets/loading_indicator.dart';
import 'package:flutter_application_1/presentation/widgets/text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskPage extends StatefulWidget {
  int id;

  TaskPage(this.id, {super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  GetTodoByIdModel? getTodoByIdModel;
  bool changingToTrue = true;

  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().getTodoById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(MyText.text(homeAppBarText, textColor: white)),
      body: Container(
        height: height(context),
        width: width(context),
        color: primaryColor,
        child: Center(
          child: BlocConsumer<TodoCubit, TodoState>(
            listener: (context, state) {
              if (state is TodoGotState) {
                getTodoByIdModel = state.getTodoByIdModel;
              }
            },
            builder: (context, state) {
              if (state is TodosLoadingState) {
                return LoadingIndicator.circularProgressIndicator(color: white);
              } else {
                return Container(
                  height: width(context) * 0.9,
                  width: width(context) * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          MyText.text(getTodoByIdModel!.todo,
                              textColor: white, fontSize: 18),
                          const SizedBox(height: 32),
                          MyText.text(
                            'completed ? ${getCompleted()}',
                            textColor: white,
                            fontSize: 18,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyText.text(haveYouFinishedText,
                              textColor: white, fontSize: 18),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BlocBuilder<CrudCubit, CrudState>(
                                builder: (context, state) {
                                  if (state is UpdatingTodoLoadingState &&
                                      !changingToTrue) {
                                    return Center(
                                      child: LoadingIndicator
                                          .circularProgressIndicator(
                                        color: white,
                                      ),
                                    );
                                  } else {
                                    return buildCheckButtons(
                                      () async {
                                        if (await checkInternetConnection(
                                            context)) {
                                          changingToTrue = false;
                                          if (getCompleted()) {
                                            await context
                                                .read<CrudCubit>()
                                                .updateTodo(
                                                  getTodoByIdModel!.id,
                                                  false,
                                                );
                                            await context
                                                .read<TodoCubit>()
                                                .getTodoById(
                                                    getTodoByIdModel!.id);
                                            setState(() {});
                                          }
                                        }
                                      },
                                      context,
                                      Icons.close,
                                      red,
                                    );
                                  }
                                },
                              ),
                              const SizedBox(width: 20),
                              BlocBuilder<CrudCubit, CrudState>(
                                builder: (context, state) {
                                  if (state is UpdatingTodoLoadingState &&
                                      changingToTrue) {
                                    return Center(
                                      child: LoadingIndicator
                                          .circularProgressIndicator(
                                        color: white,
                                      ),
                                    );
                                  } else {
                                    return buildCheckButtons(
                                      () async {
                                        if (await checkInternetConnection(
                                            context)) {
                                          changingToTrue = true;
                                          await context
                                              .read<CrudCubit>()
                                              .updateTodo(
                                                getTodoByIdModel!.id,
                                                true,
                                              );
                                          await context
                                              .read<TodoCubit>()
                                              .getTodoById(
                                                  getTodoByIdModel!.id);
                                          setState(() {});
                                        }
                                      },
                                      context,
                                      Icons.check,
                                      green,
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MyGestureDetector.gestureDetector(
                                  onTap: () {
                                    MyAlertDialog.alertDialogWithCubit<
                                        CrudCubit,
                                        CrudState,
                                        DeletingTodoLoadingState,
                                        TodoDeletedState>(
                                      firstButtonLoad: true,
                                      todoInListener: () {
                                        //removeWhere method where used to delete the deleted Item from the todos list
                                        skipAndLimitTodoModel!.todos
                                            .removeWhere(
                                          (element) => element.id == getTodoByIdModel!.id,
                                        );
                                        popScreen(context);
                                        popScreen(context);
                                      },
                                      context,
                                      title: deleteButtonTitle,
                                      firstButton: deleteFirstButtonTitle,
                                      firstPressed: () {
                                        context
                                            .read<CrudCubit>()
                                            .deleteTodo(getTodoByIdModel!.id);
                                      },
                                      secondButton: deleteSecondButtonTitle,
                                      secondPressed: () {
                                        popScreen(context);
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: width(context) * 0.2,
                                    height: width(context) * 0.1,
                                    decoration: BoxDecoration(
                                      color: red,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: MyText.text(deleteText,
                                          textColor: white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  buildCheckButtons(onTap, BuildContext context, IconData icon, Color color) {
    return MyGestureDetector.gestureDetector(
      onTap: onTap,
      child: Container(
        height: width(context) * 0.09,
        width: width(context) * 0.09,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Icon(
            icon,
            color: white,
          ),
        ),
      ),
    );
  }

  bool getCompleted() {
    return getTodoByIdModel!.completed;
  }
}
