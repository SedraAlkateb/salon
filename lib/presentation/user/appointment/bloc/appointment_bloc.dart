import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/all_appointment_usecase.dart';

part 'appointment_event.dart';
part 'appointment_state.dart';

class AppointmentBloc extends Bloc<AppointmentEvent, AppointmentState> {
  AppointmentsBase? appointments;
  AllAppointmentUsecase allAppointmentUsecase;
  AppointmentBloc(this.allAppointmentUsecase) : super(AppointmentInitial()) {
    on<AppointmentEvent>((event, emit) async{
    if(event is AllAppointment){
    //      emit(AppointmentsLoadingState());
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
    });
    }
  }



