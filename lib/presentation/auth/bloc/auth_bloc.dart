import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:salon/app/app_preferences.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/app/di.dart';
import 'package:salon/app/user_info.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/usecase/login_admin_usecase.dart';
import 'package:salon/domain/usecase/login_customer_usecase.dart';
import 'package:salon/domain/usecase/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AppPreferences sharedPreferences =  AppPreferences(instance());
  LoginUsecase loginUsecase;
  LoginAdminUsecase loginAdminUsecase;
  LoginCustomerUsecase loginCustomerUsecase;

  int type=0;
  AuthBloc(
  {
    required this.loginUsecase,
    required this.loginAdminUsecase,
    required this.loginCustomerUsecase

  }
      ) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async{
      if(event is LogInEvent){
        Constants.type=type;
        emit(LogInLoadingState());
       if(type==0){
         (

             await loginUsecase.execute(
                 LoginRequest(
                     event.email, event.password
                 ))).fold(
                 (failure)  {
               emit(LogInErrorState(failure: failure));
             },
                 (data)  async{
               sharedPreferences.setLoggedIn(data.token,type);
               UserInfo.token=data.token;
               emit(LogInState(message: data.token));
             }

         );
       }else if(type==1){
         (

             await loginAdminUsecase.execute(
                 LoginRequest(
                     event.email, event.password
                 ))).fold(
                 (failure)  {
               emit(LogInErrorState(failure: failure));
             },
                 (data)  async{
               sharedPreferences.setLoggedIn(data.token,type);
               UserInfo.token=data.token;
               print(data.token);
               emit(LogInState(message: data.token));
             }

         );
       }else{
         (
             await loginCustomerUsecase.execute(
                 LoginRequest(
                     event.email, event.password
                 ))).fold(
                 (failure)  {
               emit(LogInErrorState(failure: failure));
             },
                 (data)  async{
               sharedPreferences.setLoggedIn(data.token,type);
               UserInfo.token=data.token;
               print(data.token);
               emit(LogInState(message: data.token));
             }

         );
       }
      }
      if(event is ChangeTypeEvent){
        type=event.type;
        print(event.type);
        emit(ChangeTypeState(type: type));
      }

    });
  }
}
