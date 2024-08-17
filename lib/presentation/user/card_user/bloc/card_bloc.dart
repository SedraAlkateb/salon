import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/all_cards_usecase.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  List<Card> cards=[];
  AllCardsUsecase allCardsUsecase;
  CardBloc(
      this.allCardsUsecase
      ) : super(CardInitial()) {
    on<CardEvent>((event, emit) async{
      if(event is AllCard){
        cards=[];
  //      emit(CardsLoadingState());
        ( await allCardsUsecase. execute()).fold(

      (failure)  {
      emit(CardsErrorState(failure: failure));
      },
      (data)  async{
      cards=data;

      emit(CardsState(data));
      }
      );
    }
    });
  }
}
