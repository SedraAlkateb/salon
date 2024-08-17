
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class AllAppointmentUsecase extends Equatable {
  Repository _repository;
  AllAppointmentUsecase(this._repository);
  Future<Either<Failure, AppointmentsBase>> execute() async{
    return await _repository.appointments();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

}




