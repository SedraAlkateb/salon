import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class ShowAppointmentUsecase extends Equatable {
final  Repository _repository;
 const ShowAppointmentUsecase(this._repository);

  Future<Either<Failure, ShowAppointment>> execute(int id) async{
    return await _repository.showAppointment(id);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];
  }




