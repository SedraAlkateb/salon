import 'dart:io';
import 'package:salon/app/constants.dart';
import 'package:dio/dio.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:retrofit/http.dart';
part 'app_api.g.dart';
@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/logout")
  Future<MessageResponse> logout(
      );
  @POST("/loginSuperAdmin")
  Future<TokenResponse> superAdminLogin(
  @Part(name: "email") String email,
  @Part(name: "password") String password,
  );
  @POST("/customerRegister")
  Future<TokenResponse> customerRegister(
      @Part(name: "name") String name,
      @Part(name: "password") String password,
      @Part(name: "c_password") String c_password,
      @Part(name: "phone_number") String phone_number,
      @Part(name: "email") String email,
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
      @Part(name: "logo_image") File logo_image,
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
  @POST("/service/store")
  Future<MessageResponse> addService(
      @Part(name: "name") String name,
      @Part(name: "description") String ?description,
      @Part(name: "image") File image,
      @Part(name: "status") String status,
      @Part(name: "price") int price,
      @Part(name: "employee_id") int employee_id
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

  @POST("/addItem/{id}")
  Future<MessageResponse> addCard(
      @Path("id") int id,
      @Part(name: "quantity") int quantity,);
  @DELETE("/deleteCartItem/{id_card}/{id_product}")
  Future<MessageResponse> deleteCardItem(
      @Path("id_card") int idCard,
      @Path("id_product") int idProduct,
      );
  @DELETE("/deleteCart/{id}")
  Future<MessageResponse> deleteCard(
      @Path("id") int id,
      );
  @GET("/allCarts")
  Future<CardsUserResponse> allCarts();
  @POST("/addAppointment/{id}")
  Future<MessageResponse> addAppointment(
      @Path("id") int id,
      @Part(name: "date") String date,
      @Part(name: "time") String time,
      );
  @DELETE("/cancelAppointment/{id}")
  Future<MessageResponse> cancelAppointment(
      @Path("id") int id,
      );
  @GET("/appointments")
  Future<AppointmentsBaseResponse> appointments();
  @GET("/showAppointment/{id}")
  Future<ShowAppointmentBaseResponse> showAppointment(
      @Path("id") int id,
      );
  @POST("/employee/store")
  Future<MessageResponse> addEmployee(
      @Part(name: "name") String name,
      @Part(name: "salary") int salary,
      @Part(name: "image") File image,
      );
  @POST("/product/store")
  Future<MessageResponse> addProduct(
      @Part(name: "name") String name,
      @Part(name: "description") String description,
      @Part(name: "price") int price,
      @Part(name: "quantity") int quantity,
      @Part(name: "image") File image
      );
  @GET("/findSalon/{find}")
  Future<SalonsBaseResponse> findSalon(
      @Path("find") String find,
      );
  @GET("/findProduct/{find}")
  Future<ProductsBaseResponse> findProduct(
      @Path("find") String find,
      );
  @GET("/findEmployee/{find}")
  Future<EmployeesBaseResponse> findEmployee(
      @Path("find") String find,
      );
  @GET("/findAdmin/{find}")
  Future<AllAdminBaseResponse> findAdmin(
      @Path("find") String find,
      );
  @POST("/updateAppointment/{id}")
  Future<MessageResponse> updateAppointment(
      @Path("id") int id,
      @Part(name: "service_id") int serviceId,
      @Part(name: "date") String? date,
  @Part(name: "time") String? time
      );
}
