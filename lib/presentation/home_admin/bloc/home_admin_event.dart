part of 'home_admin_bloc.dart';

@immutable
abstract class HomeAdminEvent extends Equatable {}

class AllAdminEvent extends HomeAdminEvent {
  AllAdminEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];


}
class DeleteAdminEvent extends HomeAdminEvent {
  final int id;
  final  int index;
  DeleteAdminEvent(this.id,this.index);
  @override
  // TODO: implement props
  List<Object?> get props =>[id,index];


}
class ViewAdminEvent extends HomeAdminEvent {
  final int id;
  ViewAdminEvent(this.id);
  @override
  // TODO: implement props
  List<Object?> get props =>[id];
}
class StoreAdminEvent extends HomeAdminEvent {
  final String name;
  final String password;
  final int salonId;
  StoreAdminEvent(this.name, this.password, this.salonId);
  @override
  // TODO: implement props
  List<Object?> get props =>[name,password,salonId];
}
class UpdateAdminEvent extends HomeAdminEvent {

  UpdateAdminEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];


}
class AddAdminEvent extends HomeAdminEvent {
  String name;
  String password;
  AddAdminEvent(this.name,this.password);
  @override
  // TODO: implement props
  List<Object?> get props =>[];


}
class AddSalonToAdminEvent  extends HomeAdminEvent{
  final int id;
  AddSalonToAdminEvent(this.id);
  @override
  List<Object?> get props => [id];

}


class ChangeSalonEvent  extends HomeAdminEvent{
  final String name;
  final int id;
  ChangeSalonEvent(this.name,this.id);
  @override
  List<Object?> get props => [name,id];

}
final class ChangeNameEvent extends HomeAdminEvent{

  ChangeNameEvent();
  @override
  List<Object?> get props => [];
}
final class CheckNameEvent extends HomeAdminEvent{
  final String name;
  CheckNameEvent({required this.name});
  @override
  List<Object?> get props => [name];
}
class FindAdmin extends HomeAdminEvent {
  String find;
  FindAdmin(this.find);
  @override
  // TODO: implement props
  List<Object?> get props =>[find];
}