
import 'package:salon/app/constants.dart';
import 'package:salon/data/responses/responses.dart';
import 'package:salon/domain/models/models.dart';

extension UserResponseMapper on TokenResponse? {
  Token toDomain() {
    return Token(
      this?.token ?? Constants.empty,

    );
  }
}
extension CardSalonResponseMapper on SalonCardResponse? {
  SalonCard toDomain() {
    return SalonCard(
      this?.id ?? Constants.zero,
      this?.name ?? Constants.empty,

    );
  }
}
extension CardResponseMapper on CardUserResponse? {
  Card toDomain() {
    return Card(
      this?.id ?? Constants.zero,
      this?.salon.toDomain(),
    );
  }
}
extension ServiceCardResponseMapper on ServiceCardResponse? {
  ServiceCard toDomain() {
    return ServiceCard(
      this?.id ?? Constants.zero,
      this?.name ?? Constants.empty,
      this?.price ?? Constants.zero,
    );
  }
}
extension AppointmentCardResponseMapper on AppointmentCardResponse? {
  AppointmentCard toDomain() {
    return AppointmentCard(
      this?.id ?? Constants.zero,
      this?.date ?? Constants.empty,
      this?.time ?? Constants.empty,
    );
  }
}
extension AppointmentsResponseMapper on AppointmentsResponse? {
  Appointments toDomain() {
    return Appointments(
      this?.id ?? Constants.zero,
      this?.appointment.toDomain(),

      this?.service.toDomain(),
      this?.salon.toDomain()
    );
  }
}
extension ShowAppointmentBaseResponseMapper on ShowAppointmentBaseResponse? {
  ShowAppointment toDomain() {
    return ShowAppointment(
        this?.id ?? Constants.zero,
        this?.service.toDomain(),
        this?.appointment.toDomain(),
        this?.salon.toDomain()
    );
  }
}

extension AppointmentsBaseResponseMapper on AppointmentsBaseResponse? {
  AppointmentsBase toDomain() {
    List<Appointments> model =(this?.appointments.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Appointments>()
        .toList();
    return AppointmentsBase(
      model,
      this?.totalPrice ?? Constants.zero,
    );
  }
}


extension CardsResponseMapper on CardsUserResponse? {
  List<Card> toDomain() {
    List<Card> model =(this?.cards.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Card>()
        .toList();
    return model;
  }
}

extension AllAdminbaseResponseMapper on AllAdminBaseResponse? {
  AllAdminModel toDomain() {
    List<Admin> model =(this?.data.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Admin>()
        .toList();
    return AllAdminModel(
        model
    );
  }
}
extension ViewAdminbaseResponseMapper on ViewAdminBaseResponse? {
  ViewAdmin toDomain() {
    List<Product> model1 =(this?.data.products?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Product>()
        .toList();
    List<Service> model2 =(this?.data.services?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Service>()
        .toList();
    return ViewAdmin(
        this?.data.id  ?? Constants.zero,
        this?.data.name  ?? Constants.empty,
      this?.data.salon  ?? Constants.empty,
        model2,
        model1
    );
  }
}
extension AdminbaseResponseMapper on AllAdminResponse? {
  Admin toDomain() {
    return Admin(
        this?.name  ?? Constants.empty,
        this?.id  ?? Constants.zero,
    );
  }
}
extension ProductResponseMapper on ProductResponse? {
  Product toDomain() {
    return Product(
      this?.id  ?? Constants.zero,
      this?.name  ?? Constants.empty,
      this?.description ?? Constants.empty,
      this?.price  ?? Constants.zero,
      this?.image ?? Constants.empty,
      this?.quantity  ?? Constants.zero,
    );
  }
}
extension ServiceResponseMapper on Service1Response? {
  Service toDomain() {
    return Service(
      this?.id  ?? Constants.zero,
      this?.name  ?? Constants.empty,
      this?.description  ?? Constants.empty,
      this?.price  ?? Constants.zero,
      this?.status  ?? Constants.empty,
      this?.date  ?? Constants.empty,
      this?.time  ?? Constants.empty,
    );
  }
}


extension EmployeeResponseMapper on EmployeeResponse? {
  Employees toDomain() {
    return Employees(
      this?.id  ?? Constants.zero,
      this?.name  ?? Constants.empty,
      this?.image ?? Constants.empty,
      this?.salary  ?? Constants.zero,
    );
  }
}

extension SalonResponseMapper on SalonsResponse? {
  SalonModel toDomain() {
    return SalonModel(
      this?.id  ?? Constants.zero,
      this?.name  ?? Constants.empty,
      this?.latitude  ?? Constants.empty,
      this?.longitude  ?? Constants.empty,
      this?.logo_image  ?? Constants.empty,
      this?.description  ?? Constants.empty,
    );
  }
}
extension SalonsResponseMapper on SalonsBaseResponse? {
  List<SalonModel> toDomain() {
    List<SalonModel> model1 =(this?.data.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<SalonModel>()
        .toList();
    return model1;
  }
}
extension ShowSalonResponseMapper on ShowSalonBaseResponse? {
  ShowSalonModel toDomain() {
    List<Product> product =(this?.data.products?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Product>()
        .toList();
    List<Employees> employees =(this?.data.employees?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Employees>()
        .toList();
    return ShowSalonModel(
      this?.data.id  ?? Constants.zero,
      this?.data.name  ?? Constants.empty,
      this?.data.latitude  ?? Constants.empty,
      this?.data.longitude  ?? Constants.empty,
      this?.data.logo_image  ?? Constants.empty,
      this?.data.description  ?? Constants.empty,
      this?.data.status  ?? Constants.empty,
      this?.data.admin  ?? Constants.empty,
      employees: employees,
      product: product
    );
  }
}
extension ServicesResponseMapper on ServicesBaseResponse? {
  List<Service> toDomain() {
    List<Service> model1 =(this?.data.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Service>()
        .toList();
    return model1;
  }
}
extension ShowServiceResponseMapper on ServiceBaseResponse? {
  ShowService toDomain() {
    Service service =Service(
      this?.data.id  ?? Constants.zero,
      this?.data.name  ?? Constants.empty,
      this?.data.description  ?? Constants.empty,
      this?.data.price  ?? Constants.zero,
      this?.data.status  ?? Constants.empty,
      this?.data.date  ?? Constants.empty,
      this?.data.time  ?? Constants.empty,);
    List<SalonModel> salons =(this?.data.salons?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<SalonModel>()
        .toList();
    return ShowService(
      service,
      this?.data.employee  ?? Constants.empty,
        salons
    );
  }
}


extension EmployeesResponseMapper on EmployeesBaseResponse? {
  List<Employees> toDomain() {
    List<Employees> model1 =(this?.data?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Employees>()
        .toList();
    return model1;
  }
}
extension ShowEmlpoyeeResponseMapper on ShowEmployeeBaseResponse? {
  ShowEmployee toDomain() {
    return  ShowEmployee(
      this?.data.id  ?? Constants.zero,
      this?.data.name  ?? Constants.empty,
      this?.data.image  ?? Constants.empty,
      this?.data.salary  ?? Constants.zero,
      this?.data.service.toDomain(),
      this?.data.admin.toDomain(),
      this?.data.salon  ?? Constants.empty,
    );
  }
}


extension ProductsResponseMapper on ProductsBaseResponse? {
  List<Product> toDomain() {
    List<Product> model1 =(this?.data?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Product>()
        .toList();
    return model1;
  }
}
extension ShowProductResponseMapper on ShowProductBaseResponse? {
  ShowProduct toDomain() {
    List<SalonModel> salons =(this?.data.salons?.map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<SalonModel>()
        .toList();
    List<Admin> admins =(this?.data.admins?. map((response) => response.toDomain()) ??
        const Iterable.empty())
        .cast<Admin>()
        .toList();
    return  ShowProduct(
      this?.data.id  ?? Constants.zero,
      this?.data.name  ?? Constants.empty,
      this?.data.description  ?? Constants.empty,
      this?.data.price  ?? Constants.zero,
      this?.data.image  ?? Constants.empty,
      this?.data.quantity  ?? Constants.zero,
        salons,
      admins
    );
  }
}


