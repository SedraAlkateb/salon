
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class StoreSalonUsecase extends Equatable {
  final Repository _repository;
  const StoreSalonUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(StoreSalonModel storeSalonRequest) async{
    return await _repository.storeSalon(storeSalonRequest);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




