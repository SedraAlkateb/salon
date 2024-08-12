
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class UpdateAdminUsecase extends Equatable {
final  Repository _repository;
 const UpdateAdminUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(UpdateAdminReq updateAdminReq ) async{
    return await _repository.updateAdmin(updateAdminReq);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




