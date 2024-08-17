import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class DeleteCardItemUsecase extends Equatable {
final  Repository _repository;
 const DeleteCardItemUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(int idCard,int idProduct ) async{
    return await _repository.deleteCardItem(idCard,idProduct);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




