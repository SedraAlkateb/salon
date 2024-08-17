import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/app/di.dart';
import 'package:salon/presentation/employee/pages/create_Employee_page.dart';
import 'package:salon/presentation/employee/pages/employees_page.dart';
import 'package:salon/presentation/employee/pages/show_employee_page.dart';
import 'package:salon/presentation/home_admin/pages/create_admin.dart';
import 'package:salon/presentation/home_admin/pages/home_admin_page.dart';
import 'package:salon/presentation/auth/pages/login_page.dart';
import 'package:salon/presentation/auth/pages/register_page.dart';
import 'package:salon/presentation/home_admin/pages/view_admin_page.dart';
import 'package:salon/presentation/location/pages/add_location_page.dart';
import 'package:salon/presentation/product/pages/create_product_page.dart';
import 'package:salon/presentation/product/pages/products_page.dart';
import 'package:salon/presentation/product/pages/show_product_page.dart';
import 'package:salon/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:salon/presentation/salon/pages/create_salon.dart';
import 'package:salon/presentation/salon/pages/salon_page.dart';
import 'package:salon/presentation/salon/pages/salons_page.dart';
import 'package:salon/presentation/service/pages/create_service_page.dart';
import 'package:salon/presentation/service/pages/services_page.dart';
import 'package:salon/presentation/service/pages/show_service_page.dart';
import 'package:salon/presentation/user/appointment/pages/all_appointments_page.dart';
import 'package:salon/presentation/user/card_user/pages/all_cards_page.dart';
import 'package:salon/presentation/user/user_home/pages/show_service_user_page.dart';
import 'package:salon/presentation/user/user_home/widgets/nav_bar.dart';
class Routes {
  static const String navPage = "/navPage";
  static const String homeAdmin = "/homeAdmin";
  static const String createAdmin = "/createAdmin";

  static const String createSalon = "/createSalon";
  static const String profilePage = "/profilePage";
  static const String updateProfilePage = "/updateProfilePage";
  static const String productPage = "/productPage";
  static const String signUpPage = "/signUpPage";
  static const String loginPage = "/loginPage";
  static const String changePassword = "/changePassword";
  static const String salons = "/salons";
  static const String salon = "/salon";
  static const String viewAdmin = "/viewAdmin";
  static const String services = "/services";
  static const String service = "/service";
  static const String createService = "/createService";
  static const String createEmployee = "/createEmployee";
  static const String createProduct = "/createProduct";

  static const String products = "/products";
  static const String product = "/product";
  static const String employees = "/employees";
  static const String employee = "/employee";
  static const String userNav = "/userNav";
  static const String serviceUser = "/serviceUser";
  static const String cards = "/cards";
  static const String appointments = "/appointments";
  static const String addLocation = "/addLocation";

}
class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginPage:
        initLoginModule();
        return MaterialPageRoute(builder: (_) =>   LoginPage());
      case Routes.signUpPage:
        return MaterialPageRoute(builder: (_) =>   RegisterPage());
      case Routes.homeAdmin:
        initAllAdminModule();
        initSalonsModule();
        return MaterialPageRoute(builder: (_) =>   const HomeAdminPage());
      case Routes.createAdmin:
        return MaterialPageRoute(builder: (_) =>    CreateAdmin());
      case Routes.salons:
        initSalonsModule();
        return MaterialPageRoute(builder: (_) =>   const Salonspage());
      case Routes.salon:
        return MaterialPageRoute(builder: (_) =>    SalonPage());
      case Routes.createSalon:
        return MaterialPageRoute(builder: (_) =>    CreateSalon());
      case Routes.viewAdmin:
        return MaterialPageRoute(builder: (_) =>     ViewAdminPage());
      case Routes.services:
        initServicesModule();
        return MaterialPageRoute(builder: (_) =>    const ServicesPage());
      case Routes.service:
        return MaterialPageRoute(builder: (_) =>    const ShowServicePage());
      case Routes.serviceUser:
        return MaterialPageRoute(builder: (_) =>    const ShowServiceUserPage());
      case Routes.createService:

        return MaterialPageRoute(builder: (_) =>    CreateServicePage());
      case Routes.createEmployee:
        return MaterialPageRoute(builder: (_) =>    CreateEmployeePage());
      case Routes.createProduct:
        return MaterialPageRoute(builder: (_) =>    CreateProductPage());

      case Routes.products:
        initProductsModule();
        return MaterialPageRoute(builder: (_) =>    const ProductsPage());
      case Routes.product:
        return MaterialPageRoute(builder: (_) =>    const ShowProductPage());
      case Routes.employees:
        initEmployeesModule();
        return MaterialPageRoute(builder: (_) =>    const EmployeesPage());
      case Routes.employee:
        return MaterialPageRoute(builder: (_) =>    const ShowEmployeePage());
      case Routes.userNav:
        initUserNavModule();
        initCardModule();
        return MaterialPageRoute(builder: (_) =>    NavPage());
      case Routes.cards:
        initCardModule();
        return MaterialPageRoute(builder: (_) =>    const AllCardsPage());
      case Routes.appointments:
        initAppointmentModule();
        return MaterialPageRoute(builder: (_) =>    const AllAppointmentsPage());
      case Routes.addLocation:
        return MaterialPageRoute(builder: (_) =>    const AddLocationPage());



      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(
                    StringsManager.noRouteFound), // string to strings manager
              ),
              body: const Center(
                  child: Text(
                      StringsManager.noRouteFound)), //string to strings manager
            ));
  }
}

