
import 'package:dartz/dartz.dart';
import 'package:salon/data/data_source/remote_data_source.dart';
import 'package:salon/data/mapper/mapper.dart';
import 'package:salon/data/network/error_handler.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/repostitory/repository.dart';

class RepositoryImp implements Repository {
  final RemoteDataSource _remoteDataSource;

// final NetworkInfo _networkInfo;

  RepositoryImp(this._remoteDataSource);

  @override
  Future<Either<Failure, Token>> login(LoginRequest loginRequest)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, AllAdminModel>> allAdmin()
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.allAdmin();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteAdmin(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteAdmin(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> storeAdmin(StoreAdminRequest storeAdmin)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.storeAdmin(storeAdmin);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
  @override
  Future<Either<Failure, ViewAdmin>> viewAdmin(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.viewAdmin(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, List<SalonModel>>> allSalon()
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.salons();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> updateAdmin(UpdateAdminReq updateAdminReq)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.updateAdmin(updateAdminReq);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteSalon(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteSalon(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, ShowSalonModel>> showSalon(int id)   async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.showSalon(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> updateSalon(UpdateSalonReq updateSalonReq)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.updateSalon(updateSalonReq);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> storeSalon(StoreSalonModel storeSalonModel)  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.storeSalon(storeSalonModel);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, List<Service>>> services() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.services();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, ShowService>> showService(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.showService(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteService(int id)async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteService(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteEmployee(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteEmployee(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteProduct(int id) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteProduct(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
  @override
  Future<Either<Failure, List<Employees>>> employees()
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.employees();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
  @override
  Future<Either<Failure, List<Product>>> products() async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.products();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, ShowEmployee>> showEmployee(int id)async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.showEmployee(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, ShowProduct>> showProduct(int id) async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.showProduct(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Token>> customerLogin(LoginRequest loginRequest)   async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.customerLogin(loginRequest);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, Token>> loginAdmin(LoginRequest loginRequest)   async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.loginAdmin(loginRequest);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> addCard(int id, int quantity)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.addCard(id,quantity);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteCard(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteCard(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> deleteCardItem(int idCard, int idProduct)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.deleteCardItem(idCard,idProduct);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure,   List<Card>>> allCard()   async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.allCarts();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> addAppointment(AppointmentReq appointmenReq)  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.addAppointment(appointmenReq);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, AppointmentsBase>> appointments()  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.appointments();
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> cancelAppointment(int id)  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.cancelAppointment(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
  @override
  Future<Either<Failure, ShowAppointment>> showAppointment(int id)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.showAppointment(id);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response.toDomain());
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }

  @override
  Future<Either<Failure, MessageResponse>> addService(AddServiceReq addServiceReq)
  async {
    try {
      //connect to internet,its safe to call Api
      final response = await _remoteDataSource.addService(addServiceReq);
      if (response.st == null) {
        //success
        //return either right
        //return data
        return Right(response);
      } else {
        //return either left
        //failure --business error
        return Left(Failure(ApiInternalStatus.FAILURE,
            response.massage ?? ResponseMassage.DEFAULT));
      }
    } catch (error) {
      return Left(ErrorHandler
          .handle(error)
          .failure);
    }
  }
}