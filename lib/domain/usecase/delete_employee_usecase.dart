import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class DeleteEmployeeUsecase extends Equatable {
final  Repository _repository;
 const DeleteEmployeeUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(int id ) async{
    return await _repository.deleteEmployee(id);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




