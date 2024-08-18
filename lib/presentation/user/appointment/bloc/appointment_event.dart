part of 'appointment_bloc.dart';

@immutable
abstract class AppointmentEvent extends Equatable{

}
class AllAppointment extends AppointmentEvent {
  AllAppointment();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
class DeleteAppointment extends AppointmentEvent {
  int id;
  int index;
  DeleteAppointment(this.id,this.index);
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}
