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
  Future<MessageResponse> storeAdmin(StoreAdminRequest storeAdminRequest) async{
    return await _appServiceClient.storeAdmin(
      storeAdminRequest.name,
      storeAdminRequest.password,
      storeAdminRequest.salonId
    );
  }

  @override
  Future<ViewAdminBaseResponse> viewAdmin(int id)async {
    return await _appServiceClient.showAdmin(
        id
    );
  }

  @override
  Future<SalonsBaseResponse> salons() async{
    return await _appServiceClient.salons(
    );
  }

  @override
  Future<MessageResponse> updateAdmin(UpdateAdminReq updateAdminReq)async{
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
  Future<MessageResponse> storeSalon(StoreSalonModel storeSalonModel)async {
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
  Future<EmployeesBaseResponse> employees()async {
    return await _appServiceClient.employees(
    );
  }
  @override
  Future<ProductsBaseResponse> products() async {
    return await _appServiceClient.products();
  }

  @override
  Future<ShowEmployeeBaseResponse> showEmployee(int id)  async {
    return await _appServiceClient.showEmployee(id);
  }
  @override
  Future<ShowProductBaseResponse> showProduct(int id)  async {
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
  Future<TokenResponse> loginAdmin(LoginRequest loginRequest)async {
    return await _appServiceClient.loginAdmin(
        loginRequest.email,
        loginRequest.password
    );
  }
}