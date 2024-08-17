part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardsState extends CardState {
  final List<Card> cards;
  CardsState(this.cards);
  List<Object?> get props =>[cards];
}
 class CardsErrorState extends CardState {
  final Failure failure;
  CardsErrorState({required this.failure});

  List<Object?> get props =>[failure];
}
 class CardsLoadingState extends CardState {
  CardsLoadingState();
  List<Object?> get props =>[];
}