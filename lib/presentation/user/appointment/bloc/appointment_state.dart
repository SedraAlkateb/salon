part of 'appointment_bloc.dart';

@immutable
sealed class AppointmentState {}

final class AppointmentInitial extends AppointmentState {}

 class AppointmentsState extends AppointmentState {
  final AppointmentsBase appointments;
  AppointmentsState(this.appointments);
  List<Object?> get props =>[appointments];
}
final class AppointmentsErrorState extends AppointmentState {
  final Failure failure;
  AppointmentsErrorState({required this.failure});
  List<Object?> get props =>[failure];
}
final class AppointmentsLoadingState extends AppointmentState {
  @override
  AppointmentsLoadingState();
  List<Object?> get props =>[];
}