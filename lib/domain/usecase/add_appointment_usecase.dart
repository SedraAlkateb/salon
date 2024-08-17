import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class AddAppointmentUsecase extends Equatable {
final  Repository _repository;
 const AddAppointmentUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(AppointmentReq  appointmentReq ) async{
    return await _repository.addAppointment(appointmentReq);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];
  }




