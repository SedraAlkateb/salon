import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/home_admin/bloc/home_admin_bloc.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
import 'package:salon/presentation/salon/bloc/salon_bloc.dart';
import 'package:salon/presentation/uniti/app_bar.dart';
import 'package:salon/presentation/uniti/custom_dropdown.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
class CreateAdmin extends StatelessWidget {
   CreateAdmin({super.key});

  final _forKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: appBarShow("Add Admin", context),
      backgroundColor: ColorManager.primary,
      body: Form(
        key: _forKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                hint: "UserName",
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this_field_is_required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                hint: "Password",
                controller: _passwordController,
                obscureText:true,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this field is required";
                  }

                  return null;
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocConsumer<SalonBloc, SalonState>(
                    listener: (context, state1) {
                      if(state1 is SalonsErrorState)
                      {
                        error(context, state1.failure.massage, state1.failure.code);
                      }

                    },
                    builder: (context, state1) {
                      return CustomDropDown(
                          hintText:"salon",
                          items: BlocProvider.of<SalonBloc>(context).salons,
                          prefixIcon: null,
                          onChanged: (value ){
                            SalonModel admin=value;
                            BlocProvider.of<HomeAdminBloc>(context).add(AddSalonToAdminEvent(admin.id));
                            },
                          validator: (value){
                          }
                      );
                    },
                  )),
              SizedBox(height: 50,),
              BlocListener<HomeAdminBloc, HomeAdminState>(
                listener: (context, state) {
                  if(state is AddAdminLoadingState){
                    loading(context);
                  }
                  if(state is AddAdminErrorState){
                    error(context,state.failure.massage,state.failure.code);
                  }
                  if(state is AddAdminState){
                    Navigator.of(context).pushNamed(Routes.homeAdmin);
                  }
                },
                child: ElevatedButton(
                  style: const ButtonStyle(),

                  onPressed: () {
                    //     state is LogInLoadingState?
                    _submit(context);
                  },
                  child: const Text("Add"),
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              )

            ],
          ),
        ),
      ),
    );
  }
  void _submit(BuildContext context){
    if (_forKey.currentState!.validate()) {
      BlocProvider.of<HomeAdminBloc>(context).add(AddAdminEvent(
        _emailController.text,
        _passwordController.text
      ));


    }
  }
}
