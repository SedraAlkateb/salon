import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/add_appointment_usecase.dart';
import 'package:salon/domain/usecase/add_item_usecase.dart';
import 'package:salon/domain/usecase/all_product_usecase.dart';
import 'package:salon/domain/usecase/all_services_usecase.dart';
import 'package:salon/domain/usecase/salons_usecase.dart';
import 'package:salon/domain/usecase/view_service_usecase.dart';

part 'user_nav_event.dart';
part 'user_nav_state.dart';

class UserNavBloc extends Bloc<UserNavEvent, UserNavState> {
  int index=0;
  List<Service> services=[];
  List<Product> products=[];
  List<SalonModel> salons=[];
  ShowService? serviceModel;
  bool isBuild=true;
  AllServicesUsecase servicesUsecase;
  SalonsUsecase salonsUsecase;
  AllProductUsecase productsUsecase;
  ViewServiceUsecase viewServiceUsecase;
  AddItemUsecase addItemUsecase;
  AddAppointmentUsecase addAppointmentUsecase;
  UserNavBloc(
      this.productsUsecase,
      this.servicesUsecase,
      this.salonsUsecase,
      this.viewServiceUsecase,
      this.addItemUsecase,
      this.addAppointmentUsecase
      ) : super(UserNavInitial()) {
    on<UserNavEvent>((event, emit) async{
      if (event is ChangeTapNav) {
        index = event.index;
        emit(IndexTabNavChanged(index: index));
      }
      if(event is AllProduct){
        emit(ProductsLoadingState());
        ( await productsUsecase. execute()).fold(

      (failure)  {
      emit(ProductsErrorState(failure: failure));
      },
      (data)  async{
      products=data;

      emit(ProductsState(data));
      }
      );
    }
      if(event is AllService){
        emit(ServicesLoadingState());
        ( await servicesUsecase. execute()).fold(

                (failure)  {
              emit(ServicesErrorState(failure: failure));
            },
                (data)  async{
              services=data;

              emit(ServicesState(data));
            }
        );
      }
      if(event is AllSalon){
        salons=[];
        emit(SalonsLoadingState());
        ( await salonsUsecase. execute()).fold(

                (failure)  {
              emit(SalonsErrorState(failure: failure));
            },
                (data)  async{
              salons=data;

              emit(SalonsState(data));
            }
        );
      }
      if(event is ShowServiceEvent){
        emit(ShowServiceLoadingState());

        ( await viewServiceUsecase. execute(event.id)).fold(
                (failure)  {
              emit(ShowServiceErrorState(failure: failure));
            },
                (data)  async{
              serviceModel=data;
              emit(ShowServiceState(data));
            }

        );
      }
      if(event is AddItemEvent){
        emit(AddItemLoadingState());
        ( await addItemUsecase. execute(
          event.id,
          event.quantity
        )).fold(
                (failure)  {
              emit(AddItemErrorState(failure: failure));
            },
                (data)  async{
              emit(AddItemState(data.message));
            }
        );
      }
      if(event is AddAppointmentEvent){
        emit(AddAppointmentLoadingState());
        ( await addAppointmentUsecase. execute(

          AppointmentReq(event.id,
              event.data,
              event.time)
        )).fold(
                (failure)  {
              emit(AddAppointmentErrorState(failure: failure));
            },
                (data)  async{
              emit(AddAppointmentState(data.message));
            }
        );
      }


    });
  }
}
