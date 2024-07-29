import 'package:flutter/cupertino.dart';

const String logoPath = 'assets/images/logo.png';
const String baseUrl = 'https://dummyjson.com/';

///splash screen constance
const String splashScreenText = '''TaskManager
Facilitates tracking projects''';

///login constance
const String loginAppBarText = 'TaskManager';
const double appBarTextSize = 22;
const String loginCapitalText = 'Log in';
const double loginCapitalTextSize = 25;
const String loginLowerText = 'log in';
const String loginButtonText = '\t log in \t';
const double loginButtonTextSize = 16;
const String userNameHint = 'enter your user name';
const String passwordHint = 'enter your password';
const double middleContainerRadius = 18;


///home constance
const String homeAppBarText = 'TaskManager';
const String noMoreData = 'no more todos to fetch';
///floating action button constance
const String floatingActionButtonTitle = 'add your new task here';
const String secondButtonTitle = 'add';
const String firstButtonTitle = 'cancel';



///task page constance
const String haveYouFinishedText = 'have you completed this todo ?';
const String deleteText = 'delete';
///delete button constance
const String deleteButtonTitle = 'Are you sure?';
const String deleteFirstButtonTitle = 'delete';
const String deleteSecondButtonTitle = 'cancel';


///error messages
const String internetIssueHappenedText = 'internet issue happened';
const String pleaseTryAgainText = 'please try again';

///database constance
const String insertedTodosDataBaseTableName = 'inserted todos';
const String deletedTodosDataBaseTableName = 'deleted todos';
const String readFromDatabase = "SELECT * FROM";



double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
