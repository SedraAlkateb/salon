import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/data/network/failure.dart';
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
  CreateServiceObject createServiceObject=CreateServiceObject
    ("", "", null, "", "", 0);
  ServiceBloc(
      this.servicesUsecase,
      this.viewServiceUsecase,
      this.deleteServiceUsecase
      ) : super(ServiceInitial()) {
    on<ServiceEvent>((event, emit) async{
      if(event is AllService){
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
    });
  }
}
