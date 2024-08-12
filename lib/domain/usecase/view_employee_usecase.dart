
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class ViewEmployeeUsecase extends Equatable {
  final Repository _repository;
  const ViewEmployeeUsecase(this._repository);

  Future<Either<Failure, ShowEmployee>> execute(int id) async{
    return await _repository.showEmployee(id);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




