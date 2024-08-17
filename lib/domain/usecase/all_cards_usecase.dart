
// ignore_for_file: must_be_immutable

import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class AllCardsUsecase extends Equatable {
  Repository _repository;
  AllCardsUsecase(this._repository);
  Future<Either<Failure, List<Card>>> execute() async{
    return await _repository.allCard();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

}




