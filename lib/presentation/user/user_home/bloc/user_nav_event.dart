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
