import 'dart:io';
class LoginRequest{
  String email;
  String password;

  LoginRequest(this.email, this.password);
}
class RegisterRequest{
   String first_name;
   String last_name;
  String email;
  String password;
   String whatsapp_number;
   RegisterRequest(this.first_name, this.last_name, this.email, this.password,
      this.whatsapp_number);
}
class Salon{
  String name;
  String description;
  String image;
  String status;
  Salon(this.name, this.description, this.image, this.status);
}
class ProfileRequest{
   String? first_name;
  String? last_name;
 String ?email;
   String ?phone_number;
   File? image;
   ProfileRequest({this.first_name,this.last_name,this.email,this.phone_number,this.image});
}
class Pagination{
  int page;
  int size;
  int isPaginate;
  Pagination({required this.page,required this.size,required this.isPaginate});
}
class ChangePasswordRequest{
  String oldP;
  String newP;
  String confirmP;
  ChangePasswordRequest({required this.oldP,required this.newP,required this.confirmP});
}
class StoreAdminRequest{
  String name;
  String password;
  int salonId;
  StoreAdminRequest({required this.name,required this.password,required this.salonId});
}
class UpdateAdminReq{
  int id;
  String? name;
  String? password;
  int? salonId;
  UpdateAdminReq(this.id,{ this.name, this.password, this.salonId});
}
class UpdateSalonReq{
  int id;
  String? name;
  String? description;
  int? adminId;
  File? logo_image;
  String? status;
  UpdateSalonReq(this.id,{
    this.name,
    this.description,
    this.adminId,
    this.logo_image,
    this.status

  });
}
