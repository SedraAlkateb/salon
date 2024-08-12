
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class AllProductUsecase extends Equatable {
  Repository _repository;
  AllProductUsecase(this._repository);
  Future<Either<Failure, List<Product>>> execute() async{
    return await _repository.products();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

}




