import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/all_employee_usecase.dart';
import 'package:salon/domain/usecase/delete_employee_usecase.dart';
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

  EmployeeBloc(
      this.employeesUsecase,
      this.viewEmployeeUsecase,
      this.deleteEmployeeUsecase
      ) : super(EmployeeInitial()) {
    on<EmployeeEvent>((event, emit) async{
      if(event is AllEmployee){
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
    });
  }
}
