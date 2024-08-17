part of 'service_bloc.dart';

@immutable
abstract class ServiceEvent  extends Equatable {}


class AllService extends ServiceEvent {
  AllService();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class DeleteServiceEvent extends ServiceEvent {
  final int id;
  final int index;
  DeleteServiceEvent(this.id,this.index);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class ShowServiceEvent extends ServiceEvent {
  final  int id;
  ShowServiceEvent(this.id,);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}

class AddEmployeeToService extends ServiceEvent {
  final  int id;
  AddEmployeeToService(this.id,);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class AddImageToService extends ServiceEvent {
  final  File image;
  AddImageToService(this.image,);
  @override
  // TODO: implement props
  List<Object?> get props =>[image];
}
class ChangeStatusFoeServiceEvent extends ServiceEvent {
  final  String status;
  ChangeStatusFoeServiceEvent(this.status,);
  @override
  // TODO: implement props
  List<Object?> get props =>[status];
}

class AddServiceEvent extends ServiceEvent {
  final  String name;
  final  String price;
  final  String desc;
  AddServiceEvent(this.name,this.price,this.desc);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}