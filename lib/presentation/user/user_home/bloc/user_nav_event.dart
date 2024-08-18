part of 'user_nav_bloc.dart';

@immutable
abstract class UserNavEvent extends Equatable{}
class ChangeTapNav extends UserNavEvent{
  final int index;
  ChangeTapNav({required this.index});
  @override
  // TODO: implement props
  List<Object?> get props =>[index];
}
class AllProduct extends UserNavEvent {
  AllProduct();
  @override
  List<Object?> get props =>[];
}
class AllService extends UserNavEvent {
  AllService();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class AllSalon extends UserNavEvent {
  AllSalon();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class ShowServiceEvent extends UserNavEvent {
  final  int id;
  ShowServiceEvent(this.id,);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class AddItemEvent extends UserNavEvent {
  final  int id;
  final int quantity;
  AddItemEvent(this.id,this.quantity);
  @override
  // TODO: implement props
  List<Object?> get props =>[id,quantity];
}
class AddAppointmentEvent extends UserNavEvent {
  final  int id;
  final String data;
  final String time;
  AddAppointmentEvent(this.id,this.data,this.time);
  @override
  // TODO: implement props
  List<Object?> get props =>[id,data,time];
}
class UserFindProduct extends UserNavEvent {
  String find;
  UserFindProduct(this.find);
  @override
  // TODO: implement props
  List<Object?> get props =>[find];
}
class  UserFindSalon extends UserNavEvent {
  String find;
  UserFindSalon(this.find);
  @override
  // TODO: implement props
  List<Object?> get props =>[find];
}