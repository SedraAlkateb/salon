import 'dart:io';
import 'package:salon/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/v1/password/change")
  Future<MessageResponse> changePassword(
      @Part(name: "old_password") String old_password,
      @Part(name: "new_password") String new_password,
      @Part(name: "confirm_password") String confirm_password,
      );
  @POST("/loginSuperAdmin")
  Future<TokenResponse> superAdminLogin(
  @Part(name: "email") String email,
  @Part(name: "password") String password,
  );
  @POST("/loginAdmin")
  Future<TokenResponse> loginAdmin(
      @Part(name: "user_name") String userName,
      @Part(name: "password") String password,
      );
  @POST("/customerLogin")
  Future<TokenResponse> customerLogin(
      @Part(name: "email") String email,
      @Part(name: "password") String password,
      );
  @GET("/admins")
  Future<AllAdminBaseResponse> viewAllAdmin(
      );
  @DELETE("/admin/delete/{id}")
  Future<MessageResponse> deleteAdmin(
      @Path("id") int id
      );
  @POST("/admin/store")
  Future<MessageResponse> storeAdmin(
      @Part(name: "user_name") String userName,
      @Part(name: "password") String password,
      @Part(name: "salon_id") int salonId,
      );
  @GET("/admin/show/{id}")
  Future<ViewAdminBaseResponse> showAdmin(
      @Path("id") int id,
      );
  @GET("/salons")
  Future<SalonsBaseResponse> salons(
      );
  @POST("/salon/store")
  Future<MessageResponse> storeSalon(
      @Part(name: "name") String name,
      @Part(name: "description") String description,
      @Part(name: "logo_image") String logo_image,
      @Part(name: "status") String status,
      @Part(name: "latitude") String latitude,
      @Part(name: "longitude") String longitude,
      );
  @DELETE("/salon/delete/{id}")
  Future<MessageResponse> deleteSalon(
      @Path("id") int id
      );
  @GET("/salon/show/{id}")
  Future<ShowSalonBaseResponse> showSalon(
      @Path("id") int id,
      );
  @POST("/salon/update/{id}")
  Future<MessageResponse> updateSalon(
      @Path("id") int id,
      {
        @Part(name: "name") String? name,
        @Part(name: "admin_id") int ?admin_id,
        @Part(name: "logo_image") File? logo_image,
      @Part(name: "description") String? description,
        @Part(name: "status") String? status,
      }
  );
  @POST("/admin/update/{id}")
  Future<MessageResponse> updateAdmin(
      @Path("id") int id,
      {
        @Part(name: "user_name") String? user_name,
        @Part(name: "password") String ?password,
        @Part(name: "salon_id") int? salon_id
      }
      );
  @GET("/service/show/{id}")
  Future<ServiceBaseResponse> showService(
      @Path("id") int id,
      );
  @GET("/services")
  Future<ServicesBaseResponse> services(
      );
  @DELETE("/service/delete/{id}")
  Future<MessageResponse> deleteService(
      @Path("id") int id
      );
  @GET("/product/show/{id}")
  Future<ShowProductBaseResponse> showProduct(
      @Path("id") int id,
      );
  @GET("/products")
  Future<ProductsBaseResponse> products(
      );
  @DELETE("/product/delete/{id}")
  Future<MessageResponse> deleteProduct(
      @Path("id") int id
      );
  @GET("/employee/show/{id}")
  Future<ShowEmployeeBaseResponse> showEmployee(
      @Path("id") int id,
      );
  @GET("/employees")
  Future<EmployeesBaseResponse> employees(
      );
  @DELETE("/employee/delete/{id}")
  Future<MessageResponse> deleteEmployee(
      @Path("id") int id
      );


}
