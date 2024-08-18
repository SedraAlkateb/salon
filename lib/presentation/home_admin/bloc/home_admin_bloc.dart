import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salon/data/network/failure.dart';
import 'package:salon/data/network/requests/requsets.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/domain/usecase/all_admin_usecase.dart';
import 'package:salon/domain/usecase/delete_admin_usecase.dart';
import 'package:salon/domain/usecase/find_admin_usecase.dart';
import 'package:salon/domain/usecase/store_admin_usecase.dart';
import 'package:salon/domain/usecase/update_admin_usecase.dart';
import 'package:salon/domain/usecase/view_admin_usecase.dart';
import 'package:salon/presentation/common/freezed_data.dart';

part 'home_admin_event.dart';
part 'home_admin_state.dart';

class HomeAdminBloc extends Bloc<HomeAdminEvent, HomeAdminState> {
  AllAdminUsecase allAdminUsecase;

  DeleteAdminUsecase deleteAdminUsecase;
  ViewAdminUsecase viewAdminUsecase;
  StoreAdminUsecase storeAdminUsecase;
  UpdateAdminUsecase updateAdminUsecase;
  FindAdminUsecase findAdminUsecase;
  CreateAdminObject createAdminObject=CreateAdminObject(null, null,null);
  List<Admin> allAdmin=[];
  ViewAdmin? viewAdmin;
  bool isBuild=false;
  setName(String name) {
    createAdminObject= createAdminObject.copyWith(name: name);
  }
  setPassword(String password) {
    createAdminObject= createAdminObject.copyWith(password: password);
  }
  setSalon(int salonId) {
    createAdminObject= createAdminObject.copyWith(id: salonId);
  }
  HomeAdminBloc(
      this.allAdminUsecase,
      this.deleteAdminUsecase,
      this.viewAdminUsecase,
      this.storeAdminUsecase,
    this.updateAdminUsecase,
    this.findAdminUsecase

    //  this.salonsUsecase
      ) : super(HomeAdminInitial()
  ) {

    on<HomeAdminEvent>((event, emit)async {
      isBuild=true;
      if(event is AllAdminEvent){
        allAdmin=[];
        emit(AllAdminLoadingState());
        ( await allAdminUsecase.execute(
      )).fold(
      (failure)  {
        isBuild=false;
      emit(AllAdminErrorState(failure: failure));
      },
      (data)  async{
        allAdmin =data.admin;
      emit(AllAdminState(allAdminModel: data));
      }

      );
    }
      if(event is FindAdmin){
        allAdmin=[];
        emit(FindAdminLoadingState());
        ( await findAdminUsecase.execute(event.find
        )).fold(
                (failure)  {
              isBuild=false;
              emit(FindAdminErrorState(failure: failure));
            },
                (data)  async{
              allAdmin =data.admin;
              emit(FindAdminState(allAdminModel: data));
            }

        );
      }
      if(event is DeleteAdminEvent){
        emit(DeleteAdminLoadingState());
        ( await deleteAdminUsecase.execute(
          event.id
        )).fold(
                (failure)  {
              emit(DeleteAdminErrorState(failure: failure));
            },
                (data)  async{
                  allAdmin.removeAt(event.index);
              emit(DeleteAdminState());
            }
        );
      }
      if(event is ViewAdminEvent){
        emit(ViewAdminLoadingState());
        ( await viewAdminUsecase.execute(
            event.id
        )).fold(
                (failure)  {
              emit(ViewAdminErrorState(failure: failure));
            },
                (data)  async{
                  viewAdmin=data;

              emit(ViewAdminState(viewAdmin: data));
                  createAdminObject=CreateAdminObject(null, null,null);
            }

        );
      }
      if(event is AddSalonToAdminEvent){
        print(event.id);
        print("id");
        setSalon(event.id);
      }
      if(event is ChangeSalonEvent){
          viewAdmin!.salon=event.name;
        setSalon(event.id);
        emit(ChangeSalonState(name: event.name));
      }
      if(event is ChangeNameEvent){

        emit(ChangeNameState());
      }
      if(event is CheckNameEvent){
        viewAdmin!.name=event.name;
        setName(event.name);
        emit(CheckNameState());
      }
      if(event is UpdateAdminEvent){
        emit(UpdateAdminLoadingState());
        ( await updateAdminUsecase.execute(
          UpdateAdminReq(viewAdmin!.id , name: createAdminObject.name, password: null, salonId:createAdminObject.id)
        )).fold(
                (failure)  {
              isBuild=false;
              emit(UpdateAdminErrorState(failure: failure));
            },
                (data)  async{

              emit(UpdateAdminState());
            }

        );
      }
      if(event is AddAdminEvent){
        emit(AddAdminLoadingState());
        ( await storeAdminUsecase.execute(
            StoreAdminRequest( name: event.name,
                password: event.password, salonId:createAdminObject.id!)
        )).fold(
                (failure)  {
              isBuild=false;
              emit(AddAdminErrorState(failure: failure));
            },
                (data)  async{

              emit(AddAdminState());
            }

        );
      }
    });
  }
}
