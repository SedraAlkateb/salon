import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/add_Employee_usecase.dart';
import 'package:salon/domain/usecase/all_employee_usecase.dart';
import 'package:salon/domain/usecase/delete_employee_usecase.dart';
import 'package:salon/domain/usecase/find_employee_usecase.dart';
import 'package:salon/domain/usecase/view_employee_usecase.dart';
import 'package:salon/presentation/common/freezed_data.dart';

part 'employee_event.dart';
part 'employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  List<Employees> employees=[];
  CreateEmployeeObject createEmployeeObject =CreateEmployeeObject("", "", null);
  ShowEmployee? employeeModel;
  AllEmployeeUsecase employeesUsecase;
  DeleteEmployeeUsecase deleteEmployeeUsecase;
  ViewEmployeeUsecase viewEmployeeUsecase;
  AddEmployeeUsecase addEmployeeUsecase;
  FindEmployeeUsecase findEmployeeUsecase;

  EmployeeBloc(
      this.employeesUsecase,
      this.viewEmployeeUsecase,
      this.deleteEmployeeUsecase,
      this.addEmployeeUsecase,
      this.findEmployeeUsecase
      ) : super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) async{
      if(event is AllEmployee){
        employees=[];
        emit(EmployeesLoadingState());
        ( await employeesUsecase. execute()).fold(

                (failure)  {
              emit(EmployeesErrorState(failure: failure));
            },
                (data)  async{
              employees=data;

              emit(EmployeesState(data));
            }
        );
      }
      if(event is FindEmployee){
        employees=[];
        emit(FindEmployeeLoadingState());
        ( await findEmployeeUsecase. execute(event.find)).fold(
                (failure)  {
              emit(FindEmployeeErrorState(failure: failure));
            },
                (data)  async{
              employees=data;

              emit(FindEmployeeState(data));
            }
        );
      }
      if(event is DeleteEmployeeEvent){
        emit(DeleteEmployeeLoadingState());
        ( await deleteEmployeeUsecase. execute(event.id)).fold(
                (failure)  {
              emit(DeleteEmployeeErrorState(failure: failure));
            },
                (data)  async{
              employees.removeAt(event.index);
              emit(DeleteEmployeeState());
            }

        );
      }
      if(event is ShowEmployeeEvent){
        emit(ShowEmployeeLoadingState());

        ( await viewEmployeeUsecase. execute(event.id)).fold(
                (failure)  {
              emit(ShowEmployeeErrorState(failure: failure));
            },
                (data)  async{
              employeeModel=data;
              emit(ShowEmployeeState(data));
            }

        );
      }
      if(event is AddEmployeeEvent){
        emit(AddEmployeeLoadingState());
        ( await addEmployeeUsecase. execute(
         AddEmployeeReq(event.name, event.salary, createEmployeeObject.image??File(""))
        )).fold(
                (failure)  {
              emit(AddEmployeeErrorState(failure: failure));
            },
                (data)  async{
              emit(AddEmployeeState());
            }

        );
      }
      if(event is AddImageToEmployeeEvent){
        createEmployeeObject=createEmployeeObject.copyWith(image: event.image);
        print(createEmployeeObject.image);
        print("createEmployeeObject.image");
        emit(AddImageToEmployee(event.image));
      }
    });
  }
}
