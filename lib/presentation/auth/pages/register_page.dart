import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:salon/presentation/uniti/text_field.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _forKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

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
                hint: "First Name",
                controller: _firstNameController,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this field is required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                hint: "Last Name",
                controller: _lastNameController,
                textInputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this_field_is_required";
                  }
                  return null;
                },
              ),
              TextFieldWidget(
                hint: "email",
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
              ElevatedButton(
                style: const ButtonStyle(),

                onPressed: () {
                  //     state is LogInLoadingState?
               //   _submit(context);
                },
                child: Text("Sign Up"),
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
}
