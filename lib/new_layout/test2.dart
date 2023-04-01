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


class  ProfileScreen2 extends StatelessWidget{
  CollectionReference userdata = FirebaseFirestore.instance.collection("users");




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context,state){},
      builder: (context,state){

        return Scaffold(
          body: Container(
            child:FutureBuilder(
              future:userdata.where("users" , isEqualTo: FirebaseAuth.instance.currentUser!.email).get() ,
              builder:(context , snapshot){

               // if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                    //itemCount: snapshot.data().docs.length,
                      itemBuilder: (context , i){
                        return Text("${snapshot.data?.docs[i].data()}");

                  }
                  );
                }
             // },

            ),
          ),

        );
      },


    );
  }

}


