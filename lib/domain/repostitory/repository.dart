
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';

abstract class Repository{
 Future<Either<Failure,Token>>login(LoginRequest loginRequest);
 Future<Either<Failure,Token>>loginAdmin(LoginRequest loginRequest);
 Future<Either<Failure,Token>>customerLogin(LoginRequest loginRequest);

 Future<Either<Failure,AllAdminModel>>allAdmin();
 Future<Either<Failure,ViewAdmin>>viewAdmin(int id);
 Future<Either<Failure,MessageResponse>>deleteAdmin(int id);
 Future<Either<Failure,MessageResponse>>updateAdmin(UpdateAdminReq updateAdminReq);
 Future<Either<Failure,MessageResponse>>storeAdmin(StoreAdminRequest storeAdmin);
 Future<Either<Failure,List<SalonModel>>>allSalon();
 Future<Either<Failure,MessageResponse>>deleteSalon(int id);
 Future<Either<Failure,ShowSalonModel>>showSalon(int id);
 Future<Either<Failure,MessageResponse>>updateSalon(UpdateSalonReq updateSalonReq);
 Future<Either<Failure,MessageResponse>> storeSalon(StoreSalonModel storeSalonModel);
 Future<Either<Failure,ShowService>> showService(int id);
 Future<Either<Failure,List<Service>>>services();
 Future<Either<Failure,MessageResponse>>deleteService(int id);

 Future<Either<Failure,ShowProduct>> showProduct(int id,);
 Future<Either<Failure,List<Product>>> products();
 Future<Either<Failure,MessageResponse>> deleteProduct( int id);
 Future<Either<Failure,ShowEmployee>> showEmployee(int id,);
 Future<Either<Failure,List<Employees>>>  employees();
 Future<Either<Failure,MessageResponse>> deleteEmployee(int id);

}