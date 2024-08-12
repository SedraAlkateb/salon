part of 'salon_bloc.dart';

@immutable
abstract class SalonEvent extends Equatable {}


class AllSalon extends SalonEvent {
  AllSalon();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class DeleteSalonEvent extends SalonEvent {
  final int id;
  final int index;
  DeleteSalonEvent(this.id,this.index);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class ShowSalonEvent extends SalonEvent {
final  int id;
final  double lat;
final  double lng;
  ShowSalonEvent(this.id,{required this.lat,required this.lng});
  @override
  // TODO: implement props
  List<Object?> get props =>[lat,lng];
}
class ChangeAdminEvent  extends SalonEvent{
  final String name;
  final int id;
  ChangeAdminEvent(this.name,this.id);
  @override
  List<Object?> get props => [name,id];

}
final class ChangeNameSalonEvent extends SalonEvent{

  ChangeNameSalonEvent();
  @override
  List<Object?> get props => [];
}
final class CheckNameSalonEvent extends SalonEvent{
  final String name;
  CheckNameSalonEvent({required this.name});
  @override
  List<Object?> get props => [name];
}
final class ChangeDescriptionSalonEvent extends SalonEvent{

  ChangeDescriptionSalonEvent();
  @override
  List<Object?> get props => [];
}
final class CheckDescriptionSalonEvent extends SalonEvent{
  final String name;
  CheckDescriptionSalonEvent({required this.name});
  @override
  List<Object?> get props => [name];
}
final class ChangeStatusEvent extends SalonEvent{
  final String status;
  ChangeStatusEvent({required this.status});
  @override
  List<Object?> get props => [status];
}
class ChangeImageSalon extends SalonEvent {
File image;
  ChangeImageSalon(this.image);
  @override
  // TODO: implement props
  List<Object?> get props =>[image];


}
class UpdateSalonEvent extends SalonEvent {

  UpdateSalonEvent();
  @override
  // TODO: implement props
  List<Object?> get props =>[];


}