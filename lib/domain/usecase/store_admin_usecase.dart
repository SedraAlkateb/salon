
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class StoreAdminUsecase extends Equatable {
  final Repository _repository;
  const StoreAdminUsecase(this._repository);

  Future<Either<Failure, MessageResponse>> execute(StoreAdminRequest storeAdminRequest) async{
    return await _repository.storeAdmin(storeAdminRequest);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




