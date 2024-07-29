import 'package:flutter_application_1/core/global_variable/global_variables.dart';
import 'package:flutter_application_1/data/model/user_info/get_user.dart';
import 'package:flutter_application_1/data/repository/user_info_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'user_info_state.dart';

class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoRepo userInfoRepo;
  UserInfoCubit(this.userInfoRepo) : super(UserInfoInitial());

  getUser() async{
    emit(UserLoadingState());
    getUserModel = await userInfoRepo.getUser();
    if(getUserModel!.errorMessage.isNotEmpty){
      emit(ErrorState(getUserModel!.errorMessage));
    }else{
      emit(LoadedState(getUserModel!));
    }
  }

}
