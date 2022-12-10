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
        return Container(
          padding: EdgeInsets.only(left: 35,top:130),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/register.png'),fit: BoxFit.cover)
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
               Container(
                 child: Text('Create\nAccount',style: TextStyle(color:Colors.white,
                   fontSize: 40,fontWeight: FontWeight.bold
                 ),),
               ), 
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*.20),

                    child: Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                         // mainAxisAlignment: MainAxisAlignment.center,
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
                              background: Colors.black54,
                              text: 'register',
                              isUppercase: true,
                            ),

                          ],
                        ),
                      ),
                    ),


                  ),
                )
              ],
            ),
          ),

        );
      },

    );
  }
}
