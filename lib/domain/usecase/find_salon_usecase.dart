
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';
class FindSalonUsecase extends Equatable {
 final Repository _repository;
 const FindSalonUsecase(this._repository);
  Future<Either<Failure, List<SalonModel>>> execute(String find) async{
    return await _repository.findSalon(find);
  }

  @override

  List<Object?> get props => [_repository];

}




