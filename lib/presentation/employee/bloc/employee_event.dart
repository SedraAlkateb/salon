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

class ShowEmployeeEvent extends EmployeeEvent {
  final  int id;
  ShowEmployeeEvent(this.id,);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

