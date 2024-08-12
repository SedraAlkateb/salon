
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class LoginAdminUsecase extends Equatable {
  final Repository _repository;
 const LoginAdminUsecase(this._repository);
  Future<Either<Failure, Token>> execute(LoginRequest loginRequestinput) async{
    return await _repository.loginAdmin(loginRequestinput);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




