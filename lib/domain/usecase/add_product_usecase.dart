import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';

@immutable
class AddProductUsecase extends Equatable {
final  Repository _repository;
 const AddProductUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(AddProductReq  productReq ) async{
    return await _repository.addProduct(productReq);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];
  }




