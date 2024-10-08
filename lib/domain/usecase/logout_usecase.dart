
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class LogoutUsecase extends Equatable {
  final Repository _repository;
  const LogoutUsecase(this._repository);
  Future<Either<Failure, MessageResponse>> execute() async{
    return await _repository.logout();
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

}




