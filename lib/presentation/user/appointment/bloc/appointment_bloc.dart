import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/all_appointment_usecase.dart';
import 'package:salon/domain/usecase/delete_appointment_usecase.dart';
import 'package:salon/domain/usecase/update_appointment_usecase.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentsBase? appointments;
  AllAppointmentUsecase allAppointmentUsecase;
  DeleteAppointmentUsecase deleteAppointmentUsecase;
  UpdateAppointmentUsecase updateAppointmentUsecase;
  AppointmentBloc(
      this.allAppointmentUsecase,
      this.deleteAppointmentUsecase,
      this.updateAppointmentUsecase
      ) : super(AppointmentInitial()) {
    on<AppointmentEvent>((event, emit) async{
    if(event is AllAppointment){
         emit(AppointmentsLoadingState());
    ( await allAppointmentUsecase. execute()).fold(

    (failure) {
    emit(AppointmentsErrorState(failure: failure));
    },
    (data) async{
    appointments=data;
    emit(AppointmentsState(data));
    }
    );
    }
    if(event is EditAppointment){
      emit(EditAppointmentLoadingState());
      ( await updateAppointmentUsecase. execute(
        EditAppointmentReq(event.id, event.idService, event.data, event.time)
      )).fold(

              (failure) {
            emit(EditAppointmentErrorState(failure: failure));
          },
              (data) async{

            emit(EditAppointmentState());
          }
      );
    }
    if(event is DeleteAppointment){
      emit(DeleteAppointmentLoadingState());
      ( await deleteAppointmentUsecase. execute(event.id)).fold(
              (failure) {
            emit(DeleteAppointmentErrorState(failure: failure));
          },
              (data) async{
            emit(DeleteAppointmentState(event.index));
          }
      );
    }
    });
    }
  }



