part of 'employee_bloc.dart';

@immutable
abstract class EmployeeState extends Equatable{}

final class EmployeeInitial extends EmployeeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}


final class EmployeesState extends EmployeeState {
  final List<Employees> employees;
  EmployeesState(this.employees);
  @override
  List<Object?> get props =>[employees];
}
final class EmployeesErrorState extends EmployeeState {
  final Failure failure;
  EmployeesErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class EmployeesLoadingState extends EmployeeState {
  @override
  EmployeesLoadingState();
  @override
  List<Object?> get props =>[];
}

final class FindEmployeeState extends EmployeeState {
  final List<Employees> employees;
  FindEmployeeState(this.employees);
  @override
  List<Object?> get props =>[employees];
}
final class FindEmployeeErrorState extends EmployeeState {
  final Failure failure;
  FindEmployeeErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class FindEmployeeLoadingState extends EmployeeState {
  @override
  FindEmployeeLoadingState();
  @override
  List<Object?> get props =>[];
}

final class DeleteEmployeeState extends EmployeeState {

  DeleteEmployeeState();
  @override
  List<Object?> get props =>[];
}
final class DeleteEmployeeErrorState extends EmployeeState {
  final Failure failure;
  DeleteEmployeeErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class DeleteEmployeeLoadingState extends EmployeeState {
  DeleteEmployeeLoadingState();
  @override
  List<Object?> get props =>[];
}

final class ShowEmployeeState extends EmployeeState {
  final ShowEmployee EmployeeModel;

  ShowEmployeeState(this.EmployeeModel);
  @override
  List<Object?> get props =>[EmployeeModel];
}
final class ShowEmployeeErrorState extends EmployeeState {
  final Failure failure;
  ShowEmployeeErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class ShowEmployeeLoadingState extends EmployeeState {
  ShowEmployeeLoadingState();
  @override
  List<Object?> get props =>[];
}
final class UpdateEmployeeState extends EmployeeState {
  UpdateEmployeeState();
  @override
  List<Object?> get props =>[];
}
final class UpdateEmployeeErrorState extends EmployeeState {
  final Failure failure;
  UpdateEmployeeErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class UpdateEmployeeLoadingState extends EmployeeState {
  UpdateEmployeeLoadingState();
  @override
  List<Object?> get props =>[];
}
final class AddEmployeeState extends EmployeeState {

  AddEmployeeState();
  @override
  List<Object?> get props =>[];
}
final class AddEmployeeErrorState extends EmployeeState {
  final Failure failure;
  AddEmployeeErrorState({required this.failure});
  @override
  List<Object?> get props =>[failure];
}
final class AddEmployeeLoadingState extends EmployeeState {
  AddEmployeeLoadingState();
  @override
  List<Object?> get props =>[];
}
final class AddImageToEmployee extends EmployeeState {
  File image;
  AddImageToEmployee(this.image);
  @override
  List<Object?> get props =>[image];
}
