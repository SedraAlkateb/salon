part of 'salon_bloc.dart';

@immutable
abstract class SalonState extends Equatable{}


final class SalonInitial extends SalonState {
  @override
  List<Object?> get props => throw UnimplementedError();

}


final class SalonsState extends SalonState {
  final List<SalonModel> salons;
    SalonsState(this.salons);
  @override
  List<Object?> get props =>[salons];
}
final class SalonsErrorState extends SalonState {
  final Failure failure;
  SalonsErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class SalonsLoadingState extends SalonState {
  @override
  SalonsLoadingState();
  @override
  List<Object?> get props =>[];
}

final class DeleteSalonState extends SalonState {

  DeleteSalonState();
  @override
  List<Object?> get props =>[];
}
final class DeleteSalonErrorState extends SalonState {
  final Failure failure;
  DeleteSalonErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class DeleteSalonLoadingState extends SalonState {
  DeleteSalonLoadingState();
  @override
  List<Object?> get props =>[];
}

final class ShowSalonState extends SalonState {
  final ShowSalonModel salonModel;

  ShowSalonState(this.salonModel);
  @override
  List<Object?> get props =>[salonModel];
}
final class ShowSalonErrorState extends SalonState {
  final Failure failure;
  ShowSalonErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class ShowSalonLoadingState extends SalonState {
  ShowSalonLoadingState();
  @override
  List<Object?> get props =>[];
}
final class UpdateSalonState extends SalonState {
  UpdateSalonState();
  @override
  List<Object?> get props =>[];
}
final class UpdateSalonErrorState extends SalonState {
  final Failure failure;
  UpdateSalonErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class UpdateSalonLoadingState extends SalonState {
  UpdateSalonLoadingState();
  @override
  List<Object?> get props =>[];
}
final class ChangeAdminState extends SalonState{
  final String name;
  ChangeAdminState({required this.name});
  @override
  List<Object?> get props => [name];
}
final class ChangeNameSalonState extends SalonState{

  ChangeNameSalonState();
  @override
  List<Object?> get props => [];
}
final class CheckNameSalonState extends SalonState{
  CheckNameSalonState();
  @override
  List<Object?> get props => [];
}
final class ChangeDescriptionSalonState extends SalonState{

  ChangeDescriptionSalonState();
  @override
  List<Object?> get props => [];
}
final class CheckDescriptionSalonState extends SalonState{
  CheckDescriptionSalonState();
  @override
  List<Object?> get props => [];
}
final class ChangeStatusSalonState extends SalonState{
  final String status;
  ChangeStatusSalonState({required this.status});
  @override
  List<Object?> get props => [status];
}
final class ChangeSalonImageState extends SalonState {
  File image;
  ChangeSalonImageState(this.image);
  @override
  List<Object?> get props =>[image];
}
class AddLocationState extends SalonState{
 Set<Marker>  marker;
  AddLocationState(this.marker);
  @override
  List<Object?> get props =>[marker];
}

final class AddSalonState extends SalonState {

  AddSalonState();
  @override
  List<Object?> get props =>[];
}
final class AddSalonErrorState extends SalonState {
  final Failure failure;
  AddSalonErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class AddSalonLoadingState extends SalonState {
  AddSalonLoadingState();
  @override
  List<Object?> get props =>[];
}

final class FindSalonState extends SalonState {
  final List<SalonModel> salons;
  FindSalonState(this.salons);
  @override
  List<Object?> get props =>[salons];
}
final class FindSalonErrorState extends SalonState {
  final Failure failure;
  FindSalonErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class FindSalonLoadingState extends SalonState {
  @override
  FindSalonLoadingState();
  @override
  List<Object?> get props =>[];
}