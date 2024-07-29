part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoadingState extends AuthState{}

class LoadedState extends AuthState{}

class ErrorState extends AuthState{
  String errorMessage;

  ErrorState(this.errorMessage);
}