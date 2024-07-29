part of 'user_info_cubit.dart';

@immutable
sealed class UserInfoState {}

final class UserInfoInitial extends UserInfoState {}

class UserLoadingState extends UserInfoState{}

class LoadedState extends UserInfoState{
  GetUserModel getUserModel;

  LoadedState(this.getUserModel);
}

class ErrorState extends UserInfoState{
  String errorMessage;

  ErrorState(this.errorMessage);
}
