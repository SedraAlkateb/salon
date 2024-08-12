
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:equatable/equatable.dart';


class ViewProductUsecase extends Equatable {
  final Repository _repository;
  const ViewProductUsecase(this._repository);

  Future<Either<Failure, ShowProduct>> execute(int id) async{
    return await _repository.showProduct(id);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [_repository];

  }




