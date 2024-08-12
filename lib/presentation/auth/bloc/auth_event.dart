part of 'auth_bloc.dart';
@immutable
abstract class AuthEvent extends Equatable{}

class LogInEvent extends AuthEvent {
  final String email;
  final String password;
  LogInEvent({required this.email,required this.password});
  @override
  // TODO: implement props
  List<Object?> get props =>[password,password];


}
class ChangeTypeEvent extends AuthEvent {
int type;
  ChangeTypeEvent({required this.type});
  @override
  // TODO: implement props
  List<Object?> get props =>[type];


}
