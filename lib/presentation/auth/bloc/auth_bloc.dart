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
import 'package:salon/domain/usecase/logout_usecase.dart';
import 'package:salon/domain/usecase/signup_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AppPreferences sharedPreferences =  AppPreferences(instance());
  LoginUsecase loginUsecase;
  LoginAdminUsecase loginAdminUsecase;
  LoginCustomerUsecase loginCustomerUsecase;
  SignupUsecase signupUsecase;
  LogoutUsecase logoutUsecase;
  int type=0;
  AuthBloc(
  {
    required this.loginUsecase,
    required this.loginAdminUsecase,
    required this.loginCustomerUsecase,
    required this.signupUsecase,
    required this.logoutUsecase

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
      if(event is SignupEvent){
        Constants.type=2;
        emit(SignupLoadingState());
        (
            await signupUsecase.execute(
                SignupRequest(
                  event.name,
                    event.password,
                    event.password_c,
                    event.phone, event.email
                ))).fold(
                (failure)  {
              emit(SignupErrorState(failure: failure));
            },
                (data)  async{
              sharedPreferences.setLoggedIn(data.token,type);
              UserInfo.token=data.token;
              emit(SignupState(message: data.token));
            }

        );
      }
      if(event is LogoutEvent){
        emit(LogoutLoadingState());
        (
            await logoutUsecase.execute()).fold(
                (failure)  {
              emit(LogoutErrorState(failure: failure));
            },
                (data)  async{
              sharedPreferences.signOut();
              UserInfo.token=null;
              emit(LogoutState());
            }

        );
      }
      if(event is ChangeTypeEvent){
        type=event.type;
        print(event.type);
        emit(ChangeTypeState(type: type));
      }

    });
  }
}
