
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class SignupUsecase extends Equatable {
  final Repository _repository;
 const SignupUsecase(this._repository);
  Future<Either<Failure, Token>> execute(SignupRequest signupReq) async{
    return await _repository.customerRegister(signupReq);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




