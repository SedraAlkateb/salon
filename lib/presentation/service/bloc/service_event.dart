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
