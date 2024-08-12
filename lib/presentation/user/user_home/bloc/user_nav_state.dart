part of 'user_nav_bloc.dart';

@immutable
abstract class UserNavState extends Equatable{}

final class UserNavInitial extends UserNavState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class IndexTabNavChanged extends UserNavState{
  final int index;
  IndexTabNavChanged({required this.index});
  @override
  List<Object?> get props => [index];

}
final class ProductsState extends UserNavState {
  final List<Product> Products;
  ProductsState(this.Products);
  @override
  List<Object?> get props =>[Products];
}
final class ProductsErrorState extends UserNavState {
  final Failure failure;
  ProductsErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class ProductsLoadingState extends UserNavState {
  @override
  ProductsLoadingState();
  @override
  List<Object?> get props =>[];
}
final class ServicesState extends UserNavState {
  final List<Service> services;
  ServicesState(this.services);
  @override
  List<Object?> get props =>[services];
}
final class ServicesErrorState extends UserNavState {
  final Failure failure;
  ServicesErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class ServicesLoadingState extends UserNavState {
  @override
  ServicesLoadingState();
  @override
  List<Object?> get props =>[];
}


final class SalonsState extends UserNavState {
  final List<SalonModel> salons;
  SalonsState(this.salons);
  @override
  List<Object?> get props =>[salons];
}
final class SalonsErrorState extends UserNavState {
  final Failure failure;
  SalonsErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class SalonsLoadingState extends UserNavState {
  @override
  SalonsLoadingState();
  @override
  List<Object?> get props =>[];
}
final class ShowServiceState extends UserNavState {
  final ShowService serviceModel;

  ShowServiceState(this.serviceModel);
  @override
  List<Object?> get props =>[serviceModel];
}
final class ShowServiceErrorState extends UserNavState {
  final Failure failure;
  ShowServiceErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class ShowServiceLoadingState extends UserNavState {
  ShowServiceLoadingState();
  @override
  List<Object?> get props =>[];
}
