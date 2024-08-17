import 'dart:io';

import 'package:salon/data/network/app_api.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';

abstract class RemoteDataSource{
  Future<TokenResponse > login(LoginRequest loginRequest);
  Future<TokenResponse > customerLogin(LoginRequest loginRequest);
  Future<TokenResponse > loginAdmin(LoginRequest loginRequest);

  Future<AllAdminBaseResponse > allAdmin();
  Future<MessageResponse > deleteAdmin(int id);
  Future<MessageResponse > storeAdmin(StoreAdminRequest storeAdminRequest);
  Future<ViewAdminBaseResponse > viewAdmin(int id);
  Future<MessageResponse> updateAdmin(UpdateAdminReq updateAdminReq);
  Future<MessageResponse> storeSalon(StoreSalonModel storeSalonModel);

  Future<SalonsBaseResponse> salons();
  Future<MessageResponse > deleteSalon(int id);
  Future<ShowSalonBaseResponse > showSalon(int id);
  Future<MessageResponse> updateSalon(UpdateSalonReq updateSalonReq);

  Future<ServiceBaseResponse> showService(int id,);
  Future<ServicesBaseResponse> services();
  Future<MessageResponse> deleteService( int id);

  Future<ShowProductBaseResponse> showProduct(int id,);
  Future<ProductsBaseResponse> products();
  Future<MessageResponse> deleteProduct( int id);
  Future<ShowEmployeeBaseResponse> showEmployee(int id,);
  Future<EmployeesBaseResponse> employees();
  Future<MessageResponse> deleteEmployee(int id);

  Future<MessageResponse> addCard(int id, int quantity,);
  Future<MessageResponse> deleteCardItem(int idCard, int idProduct,);
  Future<MessageResponse> deleteCard(int id,);
  Future<CardsUserResponse> allCarts();
  Future<MessageResponse> addAppointment(
      AppointmentReq appointmenReq
      );

  Future<MessageResponse> cancelAppointment(int id,);
  Future<AppointmentsBaseResponse> appointments();

  Future<ShowAppointmentBaseResponse> showAppointment(
    int id,
      );

  Future<MessageResponse> addService(AddServiceReq addServiceReq);
}

class RemoteDataSourceImpl implements RemoteDataSource {

  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<TokenResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.superAdminLogin(
        loginRequest.email,
        loginRequest.password
    );
  }

  @override
  Future<AllAdminBaseResponse> allAdmin() async {
    return await _appServiceClient.viewAllAdmin(
    );
  }

  @override
  Future<MessageResponse> deleteAdmin(int id) async {
    return await _appServiceClient.deleteAdmin(
        id
    );
  }

  @override
  Future<MessageResponse> storeAdmin(
      StoreAdminRequest storeAdminRequest) async {
    return await _appServiceClient.storeAdmin(
        storeAdminRequest.name,
        storeAdminRequest.password,
        storeAdminRequest.salonId
    );
  }

  @override
  Future<ViewAdminBaseResponse> viewAdmin(int id) async {
    return await _appServiceClient.showAdmin(
        id
    );
  }

  @override
  Future<SalonsBaseResponse> salons() async {
    return await _appServiceClient.salons(
    );
  }

  @override
  Future<MessageResponse> updateAdmin(UpdateAdminReq updateAdminReq) async {
    return await _appServiceClient.updateAdmin(
        updateAdminReq.id,
        password: updateAdminReq.password,
        salon_id: updateAdminReq.salonId,
        user_name: updateAdminReq.name

    );
  }

  @override
  Future<MessageResponse> deleteSalon(int id) async {
    return await _appServiceClient.deleteSalon(
        id
    );
  }

  @override
  Future<ShowSalonBaseResponse> showSalon(int id) async {
    return await _appServiceClient.showSalon(id);
  }

  @override
  Future<MessageResponse> updateSalon(UpdateSalonReq updateSalonReq) async {
    return await _appServiceClient.updateSalon(updateSalonReq.id,
      name: updateSalonReq.name,
      status: updateSalonReq.status,
      admin_id: updateSalonReq.adminId,
      description: updateSalonReq.description,
      logo_image: updateSalonReq.logo_image,
    );
  }

  @override
  Future<MessageResponse> storeSalon(StoreSalonModel storeSalonModel) async {
    return await _appServiceClient.storeSalon(
      storeSalonModel.name,
      storeSalonModel.description,
      storeSalonModel.logo_image,
      storeSalonModel.status,
      storeSalonModel.latitude,
      storeSalonModel.longitude,

    );
  }

  @override
  Future<ServicesBaseResponse> services() async {
    return await _appServiceClient.services();
  }

  @override
  Future<ServiceBaseResponse> showService(int id) async {
    return await _appServiceClient.showService(id);
  }

  @override
  Future<MessageResponse> deleteService(int id) async {
    return await _appServiceClient.deleteService(id);
  }

  @override
  Future<MessageResponse> deleteEmployee(int id) async {
    return await _appServiceClient.deleteEmployee(
        id
    );
  }

  @override
  Future<MessageResponse> deleteProduct(int id) async {
    return await _appServiceClient.deleteProduct(
        id
    );
  }

  @override
  Future<EmployeesBaseResponse> employees() async {
    return await _appServiceClient.employees(
    );
  }

  @override
  Future<ProductsBaseResponse> products() async {
    return await _appServiceClient.products();
  }

  @override
  Future<ShowEmployeeBaseResponse> showEmployee(int id) async {
    return await _appServiceClient.showEmployee(id);
  }

  @override
  Future<ShowProductBaseResponse> showProduct(int id) async {
    return await _appServiceClient.showProduct(id);
  }

  @override
  Future<TokenResponse> customerLogin(LoginRequest loginRequest) async {
    return await _appServiceClient.customerLogin(
        loginRequest.email,
        loginRequest.password
    );
  }

  @override
  Future<TokenResponse> loginAdmin(LoginRequest loginRequest) async {
    return await _appServiceClient.loginAdmin(
        loginRequest.email,
        loginRequest.password
    );
  }

  @override
  Future<MessageResponse> addCard(int id, int quantity) async {
    return await _appServiceClient.addCard(
        id,
        quantity
    );
  }

  @override
  Future<MessageResponse> deleteCard(int id) async {
    return await _appServiceClient.deleteCard(
        id
    );
  }

  @override
  Future<MessageResponse> deleteCardItem(int idCard, int idProduct) async {
    return await _appServiceClient.deleteCardItem(
        idCard,
        idProduct
    );
  }

  @override
  Future<CardsUserResponse> allCarts() async {
    return await _appServiceClient.allCarts(
    );
  }

  @override
  Future<MessageResponse> addAppointment(AppointmentReq appointmenReq) async {
    return await _appServiceClient.addAppointment(
        appointmenReq.id,
        appointmenReq.date,
        appointmenReq.time
    );
  }

  @override
  Future<AppointmentsBaseResponse> appointments() async {
    return await _appServiceClient.appointments(
    );
  }

  @override
  Future<MessageResponse> cancelAppointment(int id) async {
    return await _appServiceClient.cancelAppointment(id
    );
  }

  @override
  Future<ShowAppointmentBaseResponse> showAppointment(int id) async {
    return await _appServiceClient.showAppointment(
        id
    );
  }

  @override
  Future<MessageResponse> addService(AddServiceReq addServiceReq) async {
    return await _appServiceClient.addService(
        addServiceReq.name,addServiceReq.description,addServiceReq.image??File(""),
        addServiceReq.status,addServiceReq.price,addServiceReq.employee_id);
  }
}