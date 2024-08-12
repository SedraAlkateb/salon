
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';
class SalonsUsecase extends Equatable {
 final Repository _repository;
 const SalonsUsecase(this._repository);
  Future<Either<Failure, List<SalonModel>>> execute() async{
    return await _repository.allSalon();
  }

  @override

  List<Object?> get props => [_repository];

}




