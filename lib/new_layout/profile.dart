import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/new_layout/states_new_layout.dart';
import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class  ProfileScreen extends StatelessWidget{
   CollectionReference data = FirebaseFirestore.instance.collection("users");



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialRegisterCubit,SocialRegisterStates>(
      listener: (context,state){},
      builder: (context,state){
        var usermodel=SocialRegisterCubit.get(context).model;

        return Scaffold(


          body: FutureBuilder(
        future:data.where("users" , isEqualTo: FirebaseAuth.instance.currentUser).get() ,
    builder:(context , snapshot) {
          return Center(
            child: SingleChildScrollView(
              child: Stack(
                children: [

                  Container(height: 100,),
                  Container(
                    alignment: Alignment.center,

                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 5, color: Colors.white),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12,
                                blurRadius: 20,
                                offset: const Offset(5, 5),),
                            ],
                          ),
                          child: Icon(
                            Icons.person, size: 80, color: Colors.grey.shade300,),
                        ),
                        SizedBox(height: 20,),
                        Text('${usermodel?.name}', style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),),

                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 9.0, bottom: 4.0),
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "User Information",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Card(
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          ...ListTile.divideTiles(
                                            color: Colors.grey,
                                            tiles: [
                                              ListTile(
                                                contentPadding: EdgeInsets
                                                    .symmetric(
                                                    horizontal: 12, vertical: 4),
                                                leading: Icon(Icons.person),
                                                title: Text("full name"),
                                                subtitle: Text(
                                                    '${usermodel?.name}'),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.email),
                                                title: Text("Email"),
                                                subtitle: Text(
                                                    "${usermodel?.email}"),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.phone),
                                                title: Text("Phone"),
                                                subtitle: Text(
                                                    "${usermodel?.phone}"),
                                              ),

                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );


    }
          ),
        );
      },


    );
  }
}
