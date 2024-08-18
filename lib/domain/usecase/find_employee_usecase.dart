
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class FindEmployeeUsecase extends Equatable {
  Repository _repository;
  FindEmployeeUsecase(this._repository);
  Future<Either<Failure, List<Employees>>> execute(String find) async{
    return await _repository.findEmployee(find);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

}




