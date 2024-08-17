part of 'card_bloc.dart';

@immutable
abstract class CardEvent extends Equatable{}
class AllCard extends CardEvent {
  AllCard();
  @override
  // TODO: implement props
  List<Object?> get props =>[];
}