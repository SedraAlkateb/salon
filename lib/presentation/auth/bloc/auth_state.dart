part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable{}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw UnimplementedError();
}
final class LogInState extends AuthState {
  final String message;
  LogInState({required this.message});
  @override
  List<Object?> get props =>[message];
}
final class LogInErrorState extends AuthState {
  final Failure failure;
  LogInErrorState({required this.failure});
  @override

  List<Object?> get props =>[failure];
}
final class LogInLoadingState extends AuthState {
  @override
  LogInLoadingState();
  @override
  List<Object?> get props =>[];
}
final class ChangeTypeState extends AuthState {
  int type;
  @override
  ChangeTypeState({required this.type});
  @override
  List<Object?> get props =>[type];
}