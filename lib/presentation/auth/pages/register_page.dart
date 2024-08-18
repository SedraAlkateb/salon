import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/presentation/auth/bloc/auth_bloc.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _forKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: null,
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        child: Form(
          key: _forKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.login,scale: 2,),
              TextFieldWidget(
                hint: "Name",
                controller: _nameController,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this field is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                hint: "Email",
                controller: _emailController,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this_field_is_required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                hint: "Phone",
                controller: _phoneController,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this_field_is_required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                hint: "password",
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
              TextFieldWidget(
                hint: "Confirm Password",
                controller: _passwordCController,
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
                padding: const EdgeInsets.all(AppPadding.p28),
                child:Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "go back to ",
                        style: Theme.of(context).textTheme.labelSmall,

                        children: <TextSpan>[
                          TextSpan(
                              text: "-> login",
                              style: Theme.of(context).textTheme.headlineMedium,
                              recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context,
                                      Routes.loginPage);
                                }),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is SignupLoadingState){
      loading(context);
    }
    if(state is SignupErrorState){
      error(context,state.failure.massage,state.failure.code);
    }
    if(state is SignupState){
      Navigator.of(context).pushNamed(Routes.userNav);
    }
  },
  child: ElevatedButton(
                style: const ButtonStyle(),

                onPressed: () {
                  _submit(context);
                },
                child: Text("Sign Up"),
              ),
),
              SizedBox(
                height: AppSize.s28
                ,
              )

            ],
          ),
        ),
      ),
    );
  }
  void _submit(BuildContext context){
    if (_forKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(SignupEvent(
        email: _emailController.text,
        password: _passwordController.text,
          password_c: _passwordCController.text,
          name: _nameController.text,
        phone: _phoneController.text
      ));
    }
  }
}
