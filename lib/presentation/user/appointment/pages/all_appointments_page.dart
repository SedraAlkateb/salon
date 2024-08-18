import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/user/appointment/bloc/appointment_bloc.dart';
import 'package:salon/domain/models/models.dart' as model;
class AllAppointmentsPage extends StatefulWidget {
  const AllAppointmentsPage({super.key});

  @override
  State<AllAppointmentsPage> createState() => _AllAppointmentsPageState();
}

class _AllAppointmentsPageState extends State<AllAppointmentsPage> {
    List<model.Appointments> appointments=[];
    int totalPrice=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.primary,
      appBar: appBarShow("Show Appointments", context),
body: Stack(
  children: [
    Center(child: Opacity(
        opacity: 0.1,
        child: Image.asset(ImageAssets.cut,fit: BoxFit.fill))),
    BlocConsumer<AppointmentBloc, AppointmentState>(
      listener: (context, state) {
        if(state is AppointmentsErrorState){
          error(context, state.failure.massage, state.failure.code);
        }
        if(state is DeleteAppointmentErrorState){
          error(context, state.failure.massage, state.failure.code);
        }
        if(state is DeleteAppointmentLoadingState){
          loading(context);
        }
      },
      builder:(context, state){

      if(state is DeleteAppointmentState){
        success(context);
        appointments.removeAt(state.index);
      }
        if(state is AppointmentsLoadingState){
       return SizedBox();
     }
        if(state is AppointmentsState){
          appointments=  state.appointments.appointments??[];
         totalPrice=state.appointments.totalPrice;
        }
          return  Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextRach(s1: "Total Price : ", s2: totalPrice.toString()),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    width: double.infinity,
                    height: AppSize.s20,
                    // color: Color,
                  ),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) =>
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: AppPadding.p16),
                        //    height: AppSize.s150,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          border:
                          Border.all(color: ColorManager.hintGrey),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(AppSize.s30)),
                          //        color: ColorManager.appointment,
                        ),
                        child: InkWell(
                          onTap: (()
                          {

                          }),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: AppPadding.p16),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: AppPadding.p2,
                                          bottom: AppPadding.p2,
                                      right:AppPadding.p16,
                                      left: AppPadding.p16),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          TextRach(
                                            s1: "Salon : ",
                                            s2: appointments[index].salon!.name,
                                          ),
                                          TextRach(
                                            s1: "service : ",
                                            s2: appointments[index].service!.name,
                                          ),
                                          TextRach(
                                            s1: "service : ",
                                            s2: appointments[index].service!.price.toString(),
                                          ),
                                          Row(children: [
                                            Expanded(child:  TextRach(
                                              s1: "data : ",
                                              s2: appointments[index].appointment!.date,
                                            ),),
                                            Expanded(child:  TextRach(
                                              s1: "time : ",
                                              s2: appointments[index].appointment!.time,
                                            ),)
                                          ],)
                                        ],
                                      )),
                                ),
                               Constants.type==0?SizedBox(): IconButton(onPressed: (){
                                  BlocProvider.of<AppointmentBloc>(context).add(DeleteAppointment(appointments[index].id,index));
                                }, icon: Icon(Icons.delete))
                              ],
                            ),
                          ),
                        ),
                      ),
                ),
              ],
            ),
          );

      }
    ),
  ],
),
    );
  }
}
