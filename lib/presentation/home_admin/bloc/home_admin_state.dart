part of 'home_admin_bloc.dart';
@immutable
abstract class HomeAdminState extends Equatable{}

final class HomeAdminInitial extends HomeAdminState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
final class AllAdminState extends HomeAdminState {
  final AllAdminModel allAdminModel;
 AllAdminState({required this.allAdminModel});
  @override
  List<Object?> get props =>[allAdminModel];
}
final class AllAdminErrorState extends HomeAdminState {
  final Failure failure;
 AllAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class AllAdminLoadingState extends HomeAdminState {
  @override
 AllAdminLoadingState();
  @override
  List<Object?> get props =>[];
}


final class DeleteAdminState extends HomeAdminState {
  DeleteAdminState();
  @override
  List<Object?> get props =>[];
}
final class DeleteAdminErrorState extends HomeAdminState {
  final Failure failure;
  DeleteAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class DeleteAdminLoadingState extends HomeAdminState {
  @override
  DeleteAdminLoadingState();
  @override
  List<Object?> get props =>[];
}


final class ViewAdminState extends HomeAdminState {
  final ViewAdmin viewAdmin;
  ViewAdminState({required this.viewAdmin});
  @override
  List<Object?> get props =>[viewAdmin];
}
final class ViewAdminErrorState extends HomeAdminState {
  final Failure failure;
  ViewAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class ViewAdminLoadingState extends HomeAdminState {
  @override
  ViewAdminLoadingState();
  @override
  List<Object?> get props =>[];
}


final class StoreAdminState extends HomeAdminState {

  StoreAdminState();
  @override
  List<Object?> get props =>[];
}
final class StoreAdminErrorState extends HomeAdminState {
  final Failure failure;
  StoreAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class StoreAdminLoadingState extends HomeAdminState {
  @override
  StoreAdminLoadingState();
  @override
  List<Object?> get props =>[];
}

final class SalonsForAdminState extends HomeAdminState {
  final List<SalonModel> salons;
  SalonsForAdminState(this.salons);
  @override
  List<Object?> get props =>[salons];
}
final class SalonsForAdminErrorState extends HomeAdminState {
  final Failure failure;
  SalonsForAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class SalonsForAdminLoadingState extends HomeAdminState {
  @override
  SalonsForAdminLoadingState();
  @override
  List<Object?> get props =>[];
}
final class ChangeSalonState extends HomeAdminState{
  final String name;
  ChangeSalonState({required this.name});
  @override
  List<Object?> get props => [name];
}
final class ChangeNameState extends HomeAdminState{

  ChangeNameState();
  @override
  List<Object?> get props => [];
}
final class CheckNameState extends HomeAdminState{
  CheckNameState();
  @override
  List<Object?> get props => [];
}
final class UpdateAdminState extends HomeAdminState {
  UpdateAdminState();
  @override
  List<Object?> get props =>[];
}
final class UpdateAdminErrorState extends HomeAdminState {
  final Failure failure;
  UpdateAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class UpdateAdminLoadingState extends HomeAdminState {
  @override
  UpdateAdminLoadingState();
  @override
  List<Object?> get props =>[];
}

final class AddAdminState extends HomeAdminState {
  AddAdminState();
  @override
  List<Object?> get props =>[];
}
final class AddAdminErrorState extends HomeAdminState {
  final Failure failure;
  AddAdminErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class AddAdminLoadingState extends HomeAdminState {
  @override
  AddAdminLoadingState();
  @override
  List<Object?> get props =>[];
}