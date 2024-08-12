// ignore_for_file: avoid_print

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/delete_salon_usecase.dart';
import 'package:salon/domain/usecase/salons_usecase.dart';
import 'package:salon/domain/usecase/store_Salon_usecase.dart';
import 'package:salon/domain/usecase/update_salon_usecase.dart';
import 'package:salon/domain/usecase/view_salon_usecase.dart';
import 'package:salon/presentation/common/freezed_data.dart';

part 'salon_event.dart';
part 'salon_state.dart';

class SalonBloc extends Bloc<SalonEvent, SalonState> {
  SalonsUsecase salonsUsecase;
  DeleteSalonUsecase deleteSalonUsecase;
  ViewSalonUsecase viewSalonUsecase;
  UpdateSalonUsecase updateSalonUsecase;
  StoreSalonUsecase storeSalonUsecase;
  ShowSalonModel? salonModel;
  final  CreateSalonObject salon=CreateSalonObject("", "", null, "active") ;

  File? image1;
int ? id;
String name="";

  List<SalonModel> salons=[];
  SalonBloc(
      this.salonsUsecase,
      this.deleteSalonUsecase,
      this.viewSalonUsecase,
      this.updateSalonUsecase,
      this.storeSalonUsecase
      ) : super(SalonInitial()) {
    on<SalonEvent>((event, emit) async{

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
      if(event is DeleteSalonEvent){
        emit(DeleteSalonLoadingState());
        ( await deleteSalonUsecase. execute(event.id)).fold(
                (failure)  {
              emit(DeleteSalonErrorState(failure: failure));
            },
                (data)  async{
              salons.removeAt(event.index);
              emit(DeleteSalonState());
            }

        );
      }
      if(event is ShowSalonEvent){
        emit(ShowSalonLoadingState());

        ( await viewSalonUsecase. execute(event.id)).fold(
                (failure)  {
              emit(ShowSalonErrorState(failure: failure));
            },
                (data)  async{
               salonModel=data;
  emit(ShowSalonState(data));
            }

        );
      }
      if(event is ChangeAdminEvent){
        id=event.id;
       // salon= salon.copyWith(admin: name);

        emit(ChangeAdminState(name: event.name));
      }
      if(event is ChangeNameSalonEvent){
        emit(ChangeNameSalonState());
      }
      if(event is CheckNameSalonEvent){
        salonModel!.name=event.name;
        emit(CheckNameSalonState());
      }
      if(event is ChangeDescriptionSalonEvent){
        emit(ChangeDescriptionSalonState());
      }
      if(event is CheckDescriptionSalonEvent){
        salonModel!.description=event.name;
        emit(CheckDescriptionSalonState());
      }
      if(event is ChangeStatusEvent){
        print(event.status);
        salonModel!.status=event.status;
        emit(ChangeStatusSalonState(status: event.status));
      }
      if(event is UpdateSalonEvent){
        emit(UpdateSalonLoadingState());
        ( await updateSalonUsecase. execute(
         UpdateSalonReq(salonModel!.id,
         logo_image: image1,
           description: salonModel!.description,
           status: salonModel!.status,
           name: salonModel!.name,
           adminId: id
         )
        )).fold(

                (failure)  {
              emit(UpdateSalonErrorState(failure: failure));
            },
                (data)  async{
              emit(UpdateSalonState());
            }
        );
      }
      if(event is ChangeImageSalon){
        image1=event.image;
       emit(ChangeSalonImageState(event.image));
      }
      if(event is UpdateSalonEvent){
        emit(UpdateSalonLoadingState());
        ( await updateSalonUsecase. execute(
            UpdateSalonReq(salonModel!.id,
                logo_image: image1,
                description: salonModel!.description,
                status: salonModel!.status,
                name: salonModel!.name,
                adminId: id
            )
        )).fold(

                (failure)  {
              emit(UpdateSalonErrorState(failure: failure));
            },
                (data)  async{
              emit(UpdateSalonState());
            }
        );
      }
    });
  }
}
