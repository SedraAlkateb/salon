import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/usecase/add_service_usecase.dart';
import 'package:salon/domain/usecase/all_services_usecase.dart';
import 'package:salon/domain/usecase/delete_service_usecase.dart';
import 'package:salon/domain/usecase/view_service_usecase.dart';
import 'package:salon/presentation/common/freezed_data.dart';

part 'service_event.dart';
part 'service_state.dart';

class ServiceBloc extends Bloc<ServiceEvent, ServiceState> {
  List<Service> services=[];
  ShowService? serviceModel;
  AllServicesUsecase servicesUsecase;
  DeleteServiceUsecase deleteServiceUsecase;
  ViewServiceUsecase viewServiceUsecase;
  AddServiceUsecase addServiceUsecase;
  CreateServiceObject createServiceObject=CreateServiceObject
    ("", "", null, "", "", 0);
  ServiceBloc(
      this.servicesUsecase,
      this.viewServiceUsecase,
      this.deleteServiceUsecase,
      this.addServiceUsecase
      ) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) async{
      if(event is AllService){
        services=[];
        emit(ServicesLoadingState());
        ( await servicesUsecase. execute()).fold(

      (failure)  {
      emit(ServicesErrorState(failure: failure));
      },
      (data)  async{
      services=data;

      emit(ServicesState(data));
      }
      );
      }
      if(event is DeleteServiceEvent){
      emit(DeleteServiceLoadingState());
      ( await deleteServiceUsecase. execute(event.id)).fold(
      (failure)  {
      emit(DeleteServiceErrorState(failure: failure));
      },
      (data)  async{
      services.removeAt(event.index);
      emit(DeleteServiceState());
      }

      );
      }
      if(event is ShowServiceEvent){
      emit(ShowServiceLoadingState());

      ( await viewServiceUsecase. execute(event.id)).fold(
      (failure)  {
      emit(ShowServiceErrorState(failure: failure));
      },
      (data)  async{
      serviceModel=data;
      emit(ShowServiceState(data));
      }

      );
      }
      if(event is AddEmployeeToService){
        createServiceObject=createServiceObject.copyWith(employeeId: event.id);
      }
      if(event is AddImageToService){
        createServiceObject=createServiceObject.copyWith(image: event.image);
        emit(AddImageToServiceState(event.image));
      }
      if(event is ChangeStatusFoeServiceEvent){
        createServiceObject=createServiceObject.copyWith(status: event.status);
        emit(ChangeStatusServiceState(status: event.status));
      }
      if(event is AddServiceEvent){
        emit(AddServiceLoadingState());

        ( await addServiceUsecase. execute(
          AddServiceReq(event.name, event.desc, createServiceObject.image,
              createServiceObject.status, int.parse(event.price), createServiceObject.employeeId)
        )).fold(
                (failure)  {
              emit(AddServiceErrorState(failure: failure));
            },
                (data)  async{
            
              emit(AddServiceState());
            }

        );
      }
    });
  }
}
