import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/custom_date.dart';
import 'package:salon/presentation/uniti/custom_time.dart';
import 'package:salon/presentation/uniti/dialog_wid.dart';
import 'package:salon/presentation/uniti/image/image.dart';
import 'package:salon/presentation/uniti/text.dart';
import 'package:salon/presentation/uniti/text_field.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
class ServiceWid extends StatelessWidget {
   ServiceWid({super.key,required this.service,required this.index});
  final Service service;
  final index;
   TextEditingController travelTime = TextEditingController();
   TextEditingController travelDate = TextEditingController();


   @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          border:
          Border.all(color: ColorManager.grey),
          borderRadius: const BorderRadius.all(
              Radius.circular(AppSize.s8)),
          //        color: ColorManager.card,
        ),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.start,
                children: [
                  SizedBox(height: 12,),
                  TextRach(
                    s1: "name service: ",
                    s2: service.name,
                  ),
                  const SizedBox(
                    height: AppSize.s8,
                  ),
                  TextRach(
                    s1: "describtion : ",
                    s2: service.description,
                  ),
                  TextRach(
                    s1: "price : ",
                    s2: "${service.price.toString()} \$",
                  ),
                  service.time==""||service.date==""?SizedBox():
                  Row(
                    children: [
                      Expanded(
                        child: TextRach(
                          s1: "time : ",
                          s2: service.time,
                        ),
                      ),
                      Expanded(
                        child: TextRach(
                          s1: "date : ",
                          s2: service.date,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<UserNavBloc>(context).add
                        (ShowServiceEvent(service.id));
                      Navigator.pushNamed(context, Routes.serviceUser);
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      color: ColorManager.myGrays,
                      child: TextRach(
                        s1: "see more ...",
                        s2: "",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
           
            InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context) => DialogFilter(
                    text: "Reservetion",
                    widget: Column(
                      children: [
                        Row(children: [
                          Expanded(child:
                          CustomTime(
                            timeInput: travelTime,
                            width: MediaQuery.of(context).size.width * 0.4,

                            onTap: () async {
                  TimeOfDay? pickedDate =
                      await showTimePicker(
                    context: context,
                    initialEntryMode:
                    TimePickerEntryMode
                        .input,
                    initialTime:
                    TimeOfDay.now(),
                    builder:
                        (context, child) {
                      return Theme(
                        data: Theme.of(
                            context)
                            .copyWith(
                          colorScheme:
                          ColorScheme
                              .light(
                            primary:
                            ColorManager.secondaryColor, // <-- SEE HERE
                            onPrimary: Colors
                                .white, // <-- SEE HERE
                            onSurface:
                            ColorManager.secondaryColor, // <-- SEE HERE
                          ),
                          textButtonTheme:
                          TextButtonThemeData(
                            style: TextButton
                                .styleFrom(
                              //primary:
                              //  secondaryColor // button text color
                            ),
                          ),
                        ),
                        child: child!,
                      );
                    },
                  );
                  if (pickedDate != null) {
                    var timeFormat =
                    DateFormat("HH:mm");
                    print(timeFormat);
                    print("timeFormat");
                    //  travelTime.text = timeFormat.format( );
                    travelTime.text =
                    '${pickedDate.hour.toString()}:${pickedDate.minute
                        .toString()}:01';
                    if (pickedDate.minute
                        .toString()
                        .length ==
                        1)
                      travelTime.text =
                      '${pickedDate.hour.toString()}:0${pickedDate.minute
                          .toString()}:01';
                    if (pickedDate.hour
                        .toString()
                        .length ==
                        1)
                      travelTime.text =
                      '0${pickedDate.hour.toString()}:${pickedDate.minute
                          .toString()}:01';
                    if (pickedDate.minute
                        .toString()
                        .length ==
                        1 &&
                        pickedDate.minute
                            .toString()
                            .length ==
                            1)
                      travelTime.text =
                      '${pickedDate.hour.toString()}:0${pickedDate.minute
                          .toString()}:01';
                  } else {
                    print(
                        "Date is not selected");
                  }
                 },
                          )
                          ),
                          SizedBox(width: 10,),
                          Expanded(child:
                          CustomDate(
                            dateInput: travelDate,
                            width: MediaQuery.of(context).size.width * 0.4,
                            onChanged: () async {
                              DateTime? pickedDate =
                              await showDatePicker(
                                context: context,
                                initialDate:
                                DateTime.now(),
                                firstDate:
                                DateTime.now()
                                    .subtract(
                                    Duration(
                                        days:
                                        0)),
                                lastDate:
                                DateTime(2101),
                                locale: null,
                                builder:
                                    (context, child) {
                                  return Theme(
                                    data: Theme.of(
                                        context)
                                        .copyWith(
                                      colorScheme:
                                      ColorScheme
                                          .light(
                                        primary:
                                        ColorManager.secondaryColor, // <-- SEE HERE
                                        onPrimary: Colors
                                            .white, // <-- SEE HERE
                                        onSurface:
                                        ColorManager.secondaryColor, // <-- SEE HERE
                                      ),
                                      textButtonTheme:
                                      TextButtonThemeData(
                                        style: TextButton
                                            .styleFrom(
                                          //primary:
                                          //  secondaryColor, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                DateFormat(
                                    'y-MM-DD')
                                    .format(
                                    pickedDate);

                                travelDate.text =
                                pickedDate
                                    .toString()
                                    .split(' ')[0];
                                print(travelDate.text);
                              } else {
                                print(
                                    "Date is not selected");
                              }
                            },
                          )
                          )
                        ],),
                        SizedBox(height: 25,),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [


                          ],
                        ),
                        ElevatedButton(onPressed: (){
                          if (travelDate.text!=""&&travelTime.text!="") {
                            BlocProvider.of<UserNavBloc>(context).add(AddAppointmentEvent
                              (
                                service.id,
                                travelDate.text,
                              travelTime.text
                            ));
                            Navigator.pop(context);
                          }
                        }, child: Text("Ok"))
                      ],
                    ),
                  ),
                );
              },
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets
                          .all(
                          6), // Adjust padding to control the size of the circle
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorManager.secondaryColor
                            .withOpacity(
                            0.3), // Transparent gray color
                      ),
                      child: Icon(
                        Icons
                            .app_registration,
                        size: 30,
                        color: ColorManager
                            .white,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Click to book a service",style: Theme.of(context).textTheme.titleLarge,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
