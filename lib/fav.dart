import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/shared/components.dart';
import 'package:final_project/shared/usermodel.dart';
import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:final_project/start_3screens/splash_screen/splash_screen.dart';
import 'package:final_project/steps.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

import 'dark/cubit_dark.dart';

class ProfileScreen2 extends StatefulWidget {
  @override
  State<ProfileScreen2> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen2> {
  CollectionReference data = FirebaseFirestore.instance.collection("users");

  late Future<SocialUserModel?> getData;


  @override
  void initState() {
    getData = getUserData();
    super.initState();
  }

  Future<SocialUserModel?> getUserData() async {
    final current = FirebaseAuth.instance.currentUser;
    final qSnapshot = await data.get();
    var doc = qSnapshot.docs.firstWhereOrNull(
          (d) => (d.data() as Map<String, dynamic>?)?['email'] == current?.email,
    );
    if (doc?.exists ?? false) {
      final map = doc?.data() as Map<String, dynamic>;
      final user = SocialUserModel.fromjson(map);
      return user;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    bool switchdark =false;
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {


        return Scaffold(
          appBar: AppBar(
           automaticallyImplyLeading: false,
            title: Text("Setting")
          ),
          body: FutureBuilder<SocialUserModel?>(
              future: getData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Something went wrong!'),
                  );
                }
                final user = snapshot.data;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                Border.all(width: 5, color: Colors.white),
                                color: Colors.blue,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20,
                                    offset: const Offset(5, 5),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.person,
                                size: 80,
                                color: Colors.grey.shade300,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            Column(
                              children: [
                                Text(
                                  '${user?.name}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${user?.email}',
                                  style: Theme.of(context).textTheme.subtitle2,),

                                SizedBox(
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),

                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.dark_mode,
                                          color: Colors.deepPurple,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Text(
                                          "Dark mode",
                                         // style: TextStyle(fontSize:22, fontWeight: FontWeight.bold),
                                            style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                        SizedBox(height: 15,),
                                        Switch(
                value:switchdark,
                onChanged: (value) {
                 switchdark  = value;
CubitDark.get(context).changeAppMode();
                },
                activeTrackColor:Colors.blueAccent,
                activeColor: Colors.white,
                ),
                                      ],
                                    ),
                                  ),

                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      navigateto(context, steps());
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.help,
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Text(
                                          "steps to use application",
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.language,
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "Langauage",
                                        style: Theme.of(context).textTheme.bodyText1,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: (){
                                      navigateto(context, SplashScreen());
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Text(
                                          "Logout",
                                          style: Theme.of(context).textTheme.bodyText1,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                              ],
                            ),






                          ],
                        ),
                      ),
                    ],

                  ),
                );
              }),
        );
      },
    );
  }
}
