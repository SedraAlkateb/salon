
import 'package:dartz/dartz.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';

abstract class Repository{
 Future<Either<Failure,Token>>login(LoginRequest loginRequest);
 Future<Either<Failure,MessageResponse>>logout();
 Future<Either<Failure,Token>>loginAdmin(LoginRequest loginRequest);
 Future<Either<Failure,Token>>customerLogin(LoginRequest loginRequest);
 Future<Either<Failure,Token>> customerRegister(SignupRequest signupReq);
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
 Future<Either<Failure,MessageResponse>> addCard(int id, int quantity);
 Future<Either<Failure,MessageResponse>> deleteCardItem(int idCard, int idProduct);
 Future<Either<Failure,MessageResponse>> deleteCard(int id);
 Future<Either<Failure,List<Card>>> allCard();

 Future<Either<Failure,MessageResponse>> addAppointment( AppointmentReq appointmenReq);

 Future<Either<Failure,MessageResponse>> cancelAppointment(int id);

 Future<Either<Failure,AppointmentsBase>> appointments();
 Future<Either<Failure,ShowAppointment>> showAppointment(int id);
 Future<Either<Failure,MessageResponse>> addService(AddServiceReq addServiceReq);
 Future<Either<Failure,MessageResponse>> addEmployee(AddEmployeeReq addEmployeeReq);
 Future<Either<Failure,MessageResponse>> addProduct(AddProductReq addProductReq);
 Future<Either<Failure,List<SalonModel>>>findSalon( String find,);
 Future<Either<Failure,List<Product>>>findProduct( String find,);
 Future<Either<Failure,List<Employees>>> findEmployee(String find,);
 Future<Either<Failure,AllAdminModel>>findAdmin( String find);
 Future<Either<Failure,MessageResponse>>updateAppointment(EditAppointmentReq editAppointmentReq);
}