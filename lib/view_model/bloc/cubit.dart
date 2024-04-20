import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/models/user_model.dart';
import 'package:login_task/repository/login_repo.dart';
import 'package:login_task/services/auth.dart';
import 'package:login_task/view_model/bloc/states.dart';
import 'package:login_task/view_model/login_view_model.dart';

class AppCubit extends Cubit<LoginState> {

 static AppCubit cubitInstance(BuildContext context)=>BlocProvider.of(context);
  AppCubit() : super(InitalState());
   LoginViewModel? loginViewModel;
  AuthenticationMethod authenticationMethod=AuthenticationMethod();

  Future getDataLogin({required UserModel userModel}) async{
    emit(SuccessState());
    var dataUser = await loginViewModel?.loginUser(userModel:userModel);
    String? result;
    if(dataUser==null){
      result ='Data Empty';
    }else{
      result ='success';
    }
      try {
        // var response = await authenticationMethod!.signInAuth(
        //     email: emailController.text, password: passwordController.text);
        if (result == 'success') {
          print('done');
        } else {
          print('Data Failure : ${dataUser}');
        }
        return dataUser;
      } on Exception catch (error) {
        print('Error is : ${error.toString()}');
      }
    return dataUser;
   }

}
