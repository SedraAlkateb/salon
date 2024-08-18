import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/uniti/search_field.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/user/user_home/bloc/user_nav_bloc.dart';
import 'package:salon/presentation/user/user_home/widgets/service_wid.dart';

class ServiceUser extends StatelessWidget {
  ServiceUser({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,

      body:  BlocConsumer<UserNavBloc, UserNavState>(
        listener: (context, state) {
          if (state is ServicesErrorState) {
            error(context, state.failure.massage, state.failure.code);
          }
          if (state is ServicesLoadingState) {
            loading(context);
          }
          if (state is ServicesState) {
            success(context);
          }
          if (state is AddAppointmentErrorState) {
            error(context, state.failure.massage, state.failure.code);
          }
          if (state is AddAppointmentLoadingState) {
            loading(context);
          }
          if (state is AddAppointmentState) {
            success(context);
          }
        },
        builder: (context, state) {
          List<Service> services =
              BlocProvider.of<UserNavBloc>(context).services;
          return SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                SearchField(searchController: _searchController),

                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (context, index) =>
                  const SizedBox(
                    width: double.infinity,
                    height: AppSize.s20,
                    // color: Color,
                  ),
                  itemCount: services.length,
                  itemBuilder: (context, index) =>
                      ServiceWid(service: services[index], index: index),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
