part of 'employee_bloc.dart';

@immutable
abstract class EmployeeEvent extends Equatable{}

class AllEmployee extends EmployeeEvent {
  AllEmployee();
  @override
  List<Object?> get props =>[];
}
class DeleteEmployeeEvent extends EmployeeEvent {
  final int id;
  final int index;
  DeleteEmployeeEvent(this.id,this.index);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class AddEmployeeEvent extends EmployeeEvent {
  final String name;
  final int salary;
  AddEmployeeEvent(this.name,this.salary);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class ShowEmployeeEvent extends EmployeeEvent {
  final  int id;
  ShowEmployeeEvent(this.id,);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
final class AddImageToEmployeeEvent extends EmployeeEvent {
  File image;
  AddImageToEmployeeEvent(this.image);
  @override
  List<Object?> get props =>[image];
}
class FindEmployee extends EmployeeEvent {
  String find;
  FindEmployee(this.find);
  @override
  // TODO: implement props
  List<Object?> get props =>[find];
}