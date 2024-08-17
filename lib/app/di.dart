
import 'package:dio/dio.dart';
import 'package:salon/app/app_preferences.dart';
import 'package:salon/data/data_source/remote_data_source.dart';
import 'package:salon/data/network/app_api.dart';
import 'package:salon/data/network/dio_factory.dart';
import 'package:salon/data/network/network_info.dart';
import 'package:salon/data/repository/repository.dart';
import 'package:salon/domain/repostitory/repository.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:salon/domain/usecase/add_appointment_usecase.dart';
import 'package:salon/domain/usecase/add_item_usecase.dart';
import 'package:salon/domain/usecase/add_service_usecase.dart';
import 'package:salon/domain/usecase/all_admin_usecase.dart';
import 'package:salon/domain/usecase/all_appointment_usecase.dart';
import 'package:salon/domain/usecase/all_cards_usecase.dart';
import 'package:salon/domain/usecase/all_employee_usecase.dart';
import 'package:salon/domain/usecase/all_product_usecase.dart';
import 'package:salon/domain/usecase/all_services_usecase.dart';
import 'package:salon/domain/usecase/delete_admin_usecase.dart';
import 'package:salon/domain/usecase/delete_employee_usecase.dart';
import 'package:salon/domain/usecase/delete_product_usecase.dart';
import 'package:salon/domain/usecase/delete_salon_usecase.dart';
import 'package:salon/domain/usecase/delete_service_usecase.dart';
import 'package:salon/domain/usecase/login_admin_usecase.dart';
import 'package:salon/domain/usecase/login_customer_usecase.dart';
import 'package:salon/domain/usecase/login_usecase.dart';
import 'package:salon/domain/usecase/salons_usecase.dart';
import 'package:salon/domain/usecase/store_Salon_usecase.dart';
import 'package:salon/domain/usecase/store_admin_usecase.dart';
import 'package:salon/domain/usecase/update_admin_usecase.dart';
import 'package:salon/domain/usecase/update_salon_usecase.dart';
import 'package:salon/domain/usecase/view_admin_usecase.dart';
import 'package:salon/domain/usecase/view_employee_usecase.dart';
import 'package:salon/domain/usecase/view_product_usecase.dart';
import 'package:salon/domain/usecase/view_salon_usecase.dart';
import 'package:salon/domain/usecase/view_service_usecase.dart';
import 'package:salon/presentation/auth/bloc/auth_bloc.dart';
import 'package:salon/presentation/employee/bloc/employee_bloc.dart';
import 'package:salon/presentation/home_admin/bloc/home_admin_bloc.dart';
import 'package:salon/presentation/product/bloc/product_bloc.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/service/bloc/service_bloc.dart';
import 'package:salon/presentation/user/appointment/bloc/appointment_bloc.dart';
import 'package:salon/presentation/user/card_user/bloc/card_bloc.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt instance=GetIt.instance;

Future<void>initAppModule()async{
  //app module itd a module where are put all generic dependencies
  //shared prefs instance
  final sharedPrefs = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() =>
  sharedPrefs);
  //app prefs instance
  instance.registerLazySingleton<AppPreferences>(() =>
      AppPreferences(instance()));
  //network info instance
  instance.registerLazySingleton<NetworkInfo>(() =>
      NetWorkInfoImpl(InternetConnectionChecker()));
  instance.registerLazySingleton<DioFactory>(() =>
      DioFactory(instance()));
  Dio dio =await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() =>
      AppServiceClient(dio));

  //remote data source
  instance.registerLazySingleton<RemoteDataSource>(() =>
      RemoteDataSourceImpl(instance<AppServiceClient>()));
  //repository
  instance.registerLazySingleton<Repository>(() =>
      RepositoryImp(
          instance()) );
}
Future<void>initLoginModule() async{

  if(!GetIt.I.isRegistered<LoginUsecase>()){
  //  instance.registerFactory<RegisterUsecase>(() =>RegisterUsecase(instance()));
    instance.registerFactory<LoginUsecase>(() =>LoginUsecase(instance()));
    instance.registerFactory<LoginAdminUsecase>(() =>LoginAdminUsecase(instance()));
    instance.registerFactory<LoginCustomerUsecase>(() =>LoginCustomerUsecase(instance()));

    instance.registerFactory<AuthBloc>(() =>AuthBloc(
        loginUsecase: instance(),
        loginAdminUsecase: instance(),
        loginCustomerUsecase:instance()
    ));
  }
}
Future<void>initDrawerModule() async{


}
Future<void>initProfileModule() async{


}
Future<void>initAllAdminModule() async{
  if(!GetIt.I.isRegistered<AllAdminUsecase>()){
    instance.registerFactory<AllAdminUsecase>(() =>AllAdminUsecase(instance()));
    instance.registerFactory<StoreAdminUsecase>(() =>StoreAdminUsecase(instance()));
    instance.registerFactory<ViewAdminUsecase>(() =>ViewAdminUsecase(instance()));
    instance.registerFactory<DeleteAdminUsecase>(() =>DeleteAdminUsecase(instance()));
    instance.registerFactory<UpdateAdminUsecase>(() =>UpdateAdminUsecase(instance()));

    //  instance.registerFactory<SalonsUsecase>(() =>SalonsUsecase(instance()));

    instance.registerFactory<HomeAdminBloc>(() =>HomeAdminBloc(instance(),instance(),instance(),instance(),instance()));
  }
}
Future<void>initSalonsModule() async{
  if(!GetIt.I.isRegistered<SalonsUsecase>()) {
    instance.registerFactory<SalonsUsecase>(() =>SalonsUsecase(instance()));
  }
  if(!GetIt.I.isRegistered<DeleteSalonUsecase>()) {
    instance.registerFactory<DeleteSalonUsecase>(() =>DeleteSalonUsecase(instance()));
    instance.registerFactory<ViewSalonUsecase>(() =>ViewSalonUsecase(instance()));
    instance.registerFactory<UpdateSalonUsecase>(() =>UpdateSalonUsecase(instance()));
    instance.registerFactory<StoreSalonUsecase>(() =>StoreSalonUsecase(instance()));

    instance.registerFactory<SalonBloc>(() =>SalonBloc(instance(),instance(),instance(),instance(),instance()));
  }


}
Future<void>initServicesModule() async{
  if(!GetIt.I.isRegistered<AllServicesUsecase>()) {
    instance.registerFactory<AllServicesUsecase>(() =>AllServicesUsecase(instance()));
  }
  if(!GetIt.I.isRegistered<DeleteServiceUsecase>()) {

    instance.registerFactory<DeleteServiceUsecase>(() =>DeleteServiceUsecase(instance()));
    instance.registerFactory<ViewServiceUsecase>(() =>ViewServiceUsecase(instance()));
//    instance.registerFactory<UpdateServiceUsecase>(() =>UpdateServiceUsecase(instance()));
    instance.registerFactory<AddServiceUsecase>(() =>AddServiceUsecase(instance()));

    instance.registerFactory<ServiceBloc>(() =>ServiceBloc(instance(),instance(),instance(),instance()));
  }


}
Future<void>initProductsModule() async{
  if(!GetIt.I.isRegistered<AllProductUsecase>()) {
    instance.registerFactory<AllProductUsecase>(() =>AllProductUsecase(instance()));
  }
  if(!GetIt.I.isRegistered<DeleteProductUsecase>()) {
    instance.registerFactory<DeleteProductUsecase>(() =>DeleteProductUsecase(instance()));
    instance.registerFactory<ViewProductUsecase>(() =>ViewProductUsecase(instance()));
//    instance.registerFactory<UpdateProductUsecase>(() =>UpdateProductUsecase(instance()));
    //  instance.registerFactory<StoreProductUsecase>(() =>StoreProductUsecase(instance()));

    instance.registerFactory<ProductBloc>(() =>ProductBloc(instance(),instance(),instance()));
  }


}

Future<void>initEmployeesModule() async{
  if(!GetIt.I.isRegistered<AllEmployeeUsecase>()) {
    instance.registerFactory<AllEmployeeUsecase>(() =>AllEmployeeUsecase(instance()));
  }
  if(!GetIt.I.isRegistered<DeleteEmployeeUsecase>()) {
    instance.registerFactory<DeleteEmployeeUsecase>(() =>DeleteEmployeeUsecase(instance()));
    instance.registerFactory<ViewEmployeeUsecase>(() =>ViewEmployeeUsecase(instance()));
//    instance.registerFactory<UpdateEmployeeUsecase>(() =>UpdateEmployeeUsecase(instance()));
    //  instance.registerFactory<StoreEmployeeUsecase>(() =>StoreEmployeeUsecase(instance()));

    instance.registerFactory<EmployeeBloc>(() =>EmployeeBloc(instance(),instance(),instance()));
  }


}
Future<void>initUserNavModule() async{
  if(!GetIt.I.isRegistered<ViewServiceUsecase>()) {
    instance.registerFactory<ViewServiceUsecase>(() =>
        ViewServiceUsecase(instance()));
  }
  if(!GetIt.I.isRegistered<SalonsUsecase>()) {
    instance.registerFactory<SalonsUsecase>(() =>SalonsUsecase(instance()));

  }
  if(!GetIt.I.isRegistered<AllServicesUsecase>()) {
    instance.registerFactory<AllServicesUsecase>(() =>AllServicesUsecase(instance()));

  }
  if(!GetIt.I.isRegistered<AllProductUsecase>()) {
    instance.registerFactory<AllProductUsecase>(() =>AllProductUsecase(instance()));

  }
  if(!GetIt.I.isRegistered<UserNavBloc>()) {
    instance.registerFactory<AddItemUsecase>(() =>AddItemUsecase(instance()));
    instance.registerFactory<AddAppointmentUsecase>(() =>AddAppointmentUsecase(instance()));


    instance.registerFactory<UserNavBloc>(() =>UserNavBloc(instance(),instance(),instance(),instance(),instance(),instance()));

  }

}
Future<void>initCardModule() async{
   if(!GetIt.I.isRegistered<AllCardsUsecase>()) {
     instance.registerFactory<AllCardsUsecase>(() =>AllCardsUsecase(instance()));
     instance.registerFactory<CardBloc>(() =>CardBloc(instance()));
   }
}
Future<void>initAppointmentModule() async{
  if(!GetIt.I.isRegistered<AllAppointmentUsecase>()) {
    instance.registerFactory<AllAppointmentUsecase>(() =>AllAppointmentUsecase(instance()));
    instance.registerFactory<AppointmentBloc>(() =>AppointmentBloc(instance()));
  }
}
