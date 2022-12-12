import 'package:final_project/screensapp/screensapp.dart';
import 'package:final_project/shared/components.dart';
import 'package:final_project/start_3screens/login_screen/cubit_login.dart';
import 'package:final_project/start_3screens/login_screen/states_login.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Logindesign extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<SocialLoginCubit, SocialLoginStates>(
      listener: (context,state){
        if(state is SocialLoginErrorState){
          Fluttertoast.showToast(msg: 'Error :(');
        }
        else if(state is SocialLoginSuccessState){
          navigateto(context, SocialApp() );
        }
      },
      builder: (context,state){
        return  Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/login.png'), fit: BoxFit.cover
              )
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(left: 35 , top: 130),
                child: Text('Welcome\nBack' , style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),),),

              Container( child: SingleChildScrollView(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.44444 , right: 35 , left: 35),
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                      ),
                      controller: emailController,
                      validator: (String? value){
                        if(value!.isEmpty){ return 'please enter your email address'; }
                      },
                    ),
                    SizedBox(height: 15,),
                    defaultFormField(

                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      suffix: SocialLoginCubit.get(context).suffix,

                      isPassword: SocialLoginCubit.get(context).isPassword,
                      suffixpressed: () {

                        SocialLoginCubit.get(context)
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
                    // SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: Text("Do you forget password?"),),
                    ),
                    SizedBox(height: 15,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text ('Sign In' ,
                          style: TextStyle(color: Color(0xff4c505b) ,
                              fontSize: 27,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xff4c505b),
                          child: IconButton(onPressed: (){
                            if(formKey.currentState!.validate()) {
                              SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                            icon: Icon(Icons.arrow_forward),
                            color: Colors.white,
                          ),
                        )
                      ],),
                    SizedBox(height: 20,),

                    Divider(color: Color(0xff4c505b),height: 40, thickness: 1.2,),
                    //  SizedBox(height: 10,),
                    Text('Social Media Login' , style: TextStyle(color: Color(0xff4c505b), fontSize: 15)),

                    Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container( padding: EdgeInsets.only(left: 5),
                            width: 55, height: 55,
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 50,
                                child:  IconButton(
                                  icon: Image.asset('assets/img/google.jpeg'),
                                  iconSize: 50,
                                  onPressed: () {},
                                )
                            ),
                          ),
                        ]
                    ),


                  ],),
                ),),)
            ],),
          ),
        );
      },

    );
  }
}
