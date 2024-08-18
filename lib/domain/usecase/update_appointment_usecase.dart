
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class UpdateAppointmentUsecase extends Equatable {
final  Repository _repository;
 const UpdateAppointmentUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(EditAppointmentReq update ) async{
    return await _repository.updateAppointment(update);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




