import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon/app/constants.dart';
import 'package:salon/domain/models/models.dart';
import 'package:salon/presentation/auth/bloc/auth_bloc.dart';
import 'package:salon/presentation/auth/widgets/category.dart';
import 'package:salon/presentation/uniti/stateWidget.dart';
import 'package:salon/presentation/uniti/text_field.dart';
import 'package:salon/presentation/resources/assets_manager.dart';
import 'package:salon/presentation/resources/color_manager.dart';
import 'package:salon/presentation/resources/routes_manager.dart';
import 'package:salon/presentation/resources/values_manager.dart';
class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final _forKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
              Padding(
                padding: const EdgeInsets.only(top: 50,right: 10),

                child: BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    int type=BlocProvider.of<AuthBloc>(context).type;
    return Container(
                  alignment: Alignment.bottomRight,
                  height: 60,
                  child: ListView.builder(

                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return  CategoryWidget(
                        function: (){
                          BlocProvider.of<AuthBloc>(context).add(ChangeTypeEvent(type: index));
                        },
                          text: typeAuth[index],
                          color:type==index?ColorManager.secondaryColor:null
                          ,colorText: type==index?ColorManager.white:null);
                    },
                    itemCount: typeAuth.length,
                  ),
                );
  },
),
              ),


              Image.asset(ImageAssets.login,scale: 2,),
              BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    if((state is ChangeTypeState)&&(state.type==1)){
      return
        TextFieldWidget(
          hint:  "user name",
          controller: _emailController,
          textInputType: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return "this_field_is_required";
            }
            return null;
          },
        );
    }
    return
      TextFieldWidget(
                hint:  "email",
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "this_field_is_required";
                  }
                  return null;
                },
              );
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
                        text: "If you don't have an account ? ",
                        style: Theme.of(context).textTheme.labelSmall,
                        children: <TextSpan>[
                          TextSpan(
                              text: "register now",
                              style: Theme.of(context).textTheme.headlineMedium,
                              recognizer:
                              TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacementNamed(
                                      context,
                                      Routes.signUpPage);
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if(state is LogInLoadingState){
      loading(context);
    }
   if(state is LogInErrorState){
     error(context,state.failure.massage,state.failure.code);
   }
   if(state is LogInState){
     Constants.type==2?
     Navigator.of(context).pushNamed(Routes.userNav):
     Constants.type==1?
     Navigator.of(context).pushNamed(Routes.services):
     Navigator.of(context).pushNamed(Routes.homeAdmin);
   }
  },
  child: ElevatedButton(
                style: const ButtonStyle(),

                onPressed: () {
                  //     state is LogInLoadingState?
                  _submit(context);
                },
                child: Text("Login"),
              ),
),
              SizedBox(
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
       BlocProvider.of<AuthBloc>(context).add(LogInEvent(
         email: _emailController.text,
        password: _passwordController.text,
       ));

  
     }
   }

}
