
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class FindAdminUsecase extends Equatable {
final  Repository _repository;
 const FindAdminUsecase(this._repository);

  Future<Either<Failure, AllAdminModel>> execute(String find ) async{
    return await _repository.findAdmin(find);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




