// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse()
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
    };

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) =>
    TokenResponse(
      json['token'] as String?,
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$TokenResponseToJson(TokenResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'token': instance.token,
    };

AllAdminResponse _$AllAdminResponseFromJson(Map<String, dynamic> json) =>
    AllAdminResponse(
      json['name'] as String?,
      (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AllAdminResponseToJson(AllAdminResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

AllAdminBaseResponse _$AllAdminBaseResponseFromJson(
        Map<String, dynamic> json) =>
    AllAdminBaseResponse(
      (json['data'] as List<dynamic>)
          .map((e) => AllAdminResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$AllAdminBaseResponseToJson(
        AllAdminBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ViewAdminResponse _$ViewAdminResponseFromJson(Map<String, dynamic> json) =>
    ViewAdminResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['salon'] as String?,
      (json['services'] as List<dynamic>?)
          ?.map((e) => Service1Response.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViewAdminResponseToJson(ViewAdminResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'salon': instance.salon,
      'services': instance.services,
      'products': instance.products,
    };

ViewAdminBaseResponse _$ViewAdminBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ViewAdminBaseResponse(
      ViewAdminResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ViewAdminBaseResponseToJson(
        ViewAdminBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

SalonsResponse _$SalonsResponseFromJson(Map<String, dynamic> json) =>
    SalonsResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['logo_image'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$SalonsResponseToJson(SalonsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'logo_image': instance.logo_image,
      'description': instance.description,
    };

SalonsBaseResponse _$SalonsBaseResponseFromJson(Map<String, dynamic> json) =>
    SalonsBaseResponse(
      (json['data'] as List<dynamic>)
          .map((e) => SalonsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$SalonsBaseResponseToJson(SalonsBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toInt(),
      json['image'] as String?,
      (json['quantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
    };

EmployeeResponse _$EmployeeResponseFromJson(Map<String, dynamic> json) =>
    EmployeeResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
      (json['salary'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EmployeeResponseToJson(EmployeeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'salary': instance.salary,
    };

Service1Response _$Service1ResponseFromJson(Map<String, dynamic> json) =>
    Service1Response(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toInt(),
      json['status'] as String?,
      json['date'] as String?,
      json['time'] as String?,
    );

Map<String, dynamic> _$Service1ResponseToJson(Service1Response instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'status': instance.status,
      'date': instance.date,
      'time': instance.time,
    };

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) =>
    ServiceResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toInt(),
      json['status'] as String?,
      json['date'] as String?,
      json['time'] as String?,
      json['employee'] as String?,
      (json['salons'] as List<dynamic>?)
          ?.map((e) => SalonsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceResponseToJson(ServiceResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'status': instance.status,
      'date': instance.date,
      'time': instance.time,
      'employee': instance.employee,
      'salons': instance.salons,
    };

ShowSalonResponse _$ShowSalonResponseFromJson(Map<String, dynamic> json) =>
    ShowSalonResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['latitude'] as String?,
      json['longitude'] as String?,
      json['logo_image'] as String?,
      json['description'] as String?,
      json['status'] as String?,
      json['admin'] as String?,
      (json['products'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['employees'] as List<dynamic>?)
          ?.map((e) => EmployeeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowSalonResponseToJson(ShowSalonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'logo_image': instance.logo_image,
      'description': instance.description,
      'status': instance.status,
      'admin': instance.admin,
      'products': instance.products,
      'employees': instance.employees,
    };

ShowSalonBaseResponse _$ShowSalonBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShowSalonBaseResponse(
      ShowSalonResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ShowSalonBaseResponseToJson(
        ShowSalonBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ServicesBaseResponse _$ServicesBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ServicesBaseResponse(
      (json['data'] as List<dynamic>)
          .map((e) => Service1Response.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ServicesBaseResponseToJson(
        ServicesBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ServiceBaseResponse _$ServiceBaseResponseFromJson(Map<String, dynamic> json) =>
    ServiceBaseResponse(
      ServiceResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ServiceBaseResponseToJson(
        ServiceBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ShowProductResponse _$ShowProductResponseFromJson(Map<String, dynamic> json) =>
    ShowProductResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['description'] as String?,
      (json['price'] as num?)?.toInt(),
      json['image'] as String?,
      (json['quantity'] as num?)?.toInt(),
      (json['salons'] as List<dynamic>?)
          ?.map((e) => SalonsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['admins'] as List<dynamic>?)
          ?.map((e) => AllAdminResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShowProductResponseToJson(
        ShowProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
      'salons': instance.salons,
      'admins': instance.admins,
    };

ShowProductBaseResponse _$ShowProductBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShowProductBaseResponse(
      ShowProductResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ShowProductBaseResponseToJson(
        ShowProductBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ProductsBaseResponse _$ProductsBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsBaseResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ProductsBaseResponseToJson(
        ProductsBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

EmployeesBaseResponse _$EmployeesBaseResponseFromJson(
        Map<String, dynamic> json) =>
    EmployeesBaseResponse(
      (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$EmployeesBaseResponseToJson(
        EmployeesBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };

ShowEmployeeResponse _$ShowEmployeeResponseFromJson(
        Map<String, dynamic> json) =>
    ShowEmployeeResponse(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['image'] as String?,
      (json['salary'] as num?)?.toInt(),
      json['service'] == null
          ? null
          : Service1Response.fromJson(json['service'] as Map<String, dynamic>),
      json['admin'] == null
          ? null
          : AllAdminResponse.fromJson(json['admin'] as Map<String, dynamic>),
      json['salon'] as String,
    );

Map<String, dynamic> _$ShowEmployeeResponseToJson(
        ShowEmployeeResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'salary': instance.salary,
      'service': instance.service,
      'admin': instance.admin,
      'salon': instance.salon,
    };

ShowEmployeeBaseResponse _$ShowEmployeeBaseResponseFromJson(
        Map<String, dynamic> json) =>
    ShowEmployeeBaseResponse(
      ShowEmployeeResponse.fromJson(json['data'] as Map<String, dynamic>),
    )
      ..st = (json['st'] as num?)?.toInt()
      ..massage = json['massage'] as String?;

Map<String, dynamic> _$ShowEmployeeBaseResponseToJson(
        ShowEmployeeBaseResponse instance) =>
    <String, dynamic>{
      'st': instance.st,
      'massage': instance.massage,
      'data': instance.data,
    };
