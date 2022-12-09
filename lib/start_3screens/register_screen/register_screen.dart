import 'package:final_project/shared/components.dart';
import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register_Screen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.blue[300],

          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(

                  margin: const EdgeInsets.only(top: 400),
                  width: double.infinity,
                  height: 450,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    margin: const EdgeInsets.only(top: 200,left: 50,right: 50),
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0.1,
                              blurRadius: 5
                          )
                        ]
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            validate: (String ?value) {
                              if (value!.isEmpty) {
                                return 'please enter your name';
                              }
                              return null;
                            },
                            label: 'User Name',
                            prifex: Icons.person,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,

                            validate: (String ?value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                              return null;
                            },
                            label: 'Email Address',
                            prifex: Icons.email_outlined,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(

                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            suffix: SocialRegisterCubit.get(context).suffix,

                            isPassword: SocialRegisterCubit.get(context).isPassword,
                            suffixpressed: () {

                              SocialRegisterCubit.get(context)
                                  .changePasswordVisibility();
                            },
                            validate: (String ? value) {
                              if (value!.isEmpty) {
                                return 'password is too short';
                              }
                              return null;
                            },
                            label: 'Password',
                            prifex: Icons.lock_outline,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (String ? value) {
                              if (value!.isEmpty) {
                                return 'please enter your phone number';
                              }
                              return null;
                            },
                            label: 'Phone',
                            prifex: Icons.phone,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          defaultButton(
                            function: () {
                              if(formKey.currentState!.validate()){

                              }

                            },
                            background: Colors.blue.shade300,
                            text: 'register',
                            isUppercase: true,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 70,left: 55,
                    child:Column(
                  children: const [
                    Text('Create Account',
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text('to get started now :)',
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 20.0),
                    ),

                  ],
                ))


              ],
            ),
          ),
        );
      },

    );
  }
}
