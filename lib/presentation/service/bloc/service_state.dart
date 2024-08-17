part of 'service_bloc.dart';

@immutable
abstract class ServiceState extends Equatable{}
final class ServiceInitial extends ServiceState {
  @override
  List<Object?> get props => throw UnimplementedError();

}

final class ServicesState extends ServiceState {
  final List<Service> services;
  ServicesState(this.services);
  @override
  List<Object?> get props =>[services];
}
final class ServicesErrorState extends ServiceState {
  final Failure failure;
  ServicesErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class ServicesLoadingState extends ServiceState {
  @override
  ServicesLoadingState();
  @override
  List<Object?> get props =>[];
}

final class DeleteServiceState extends ServiceState {

  DeleteServiceState();
  @override
  List<Object?> get props =>[];
}
final class DeleteServiceErrorState extends ServiceState {
  final Failure failure;
  DeleteServiceErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class DeleteServiceLoadingState extends ServiceState {
  DeleteServiceLoadingState();
  @override
  List<Object?> get props =>[];
}

final class ShowServiceState extends ServiceState {
  final ShowService serviceModel;

  ShowServiceState(this.serviceModel);
  @override
  List<Object?> get props =>[serviceModel];
}
final class ShowServiceErrorState extends ServiceState {
  final Failure failure;
  ShowServiceErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class ShowServiceLoadingState extends ServiceState {
  ShowServiceLoadingState();
  @override
  List<Object?> get props =>[];
}
final class UpdateServiceState extends ServiceState {
  UpdateServiceState();
  @override
  List<Object?> get props =>[];
}
final class UpdateServiceErrorState extends ServiceState {
  final Failure failure;
  UpdateServiceErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class UpdateServiceLoadingState extends ServiceState {
  UpdateServiceLoadingState();
  @override
  List<Object?> get props =>[];
}
class AddImageToServiceState extends ServiceState {
  final  File image;
  AddImageToServiceState(this.image,);
  @override
  // TODO: implement props
  List<Object?> get props =>[image];
}
final class ChangeStatusServiceState extends ServiceState{
  final String status;
  ChangeStatusServiceState({required this.status});
  @override
  List<Object?> get props => [status];
}


final class AddServiceState extends ServiceState {
  AddServiceState();
  @override
  List<Object?> get props =>[];
}
final class AddServiceErrorState extends ServiceState {
  final Failure failure;
  AddServiceErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class AddServiceLoadingState extends ServiceState {
  AddServiceLoadingState();
  @override
  List<Object?> get props =>[];
}
