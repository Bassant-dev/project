import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/shared/usermodel.dart';
import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:collection/collection.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {


        return Scaffold(
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

                return Center(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                  Border.all(width: 5, color: Colors.white),
                                  color: Colors.white,
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
                              Text(
                                '${user?.name}',
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
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
                                                      contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 4),
                                                      leading:
                                                      Icon(Icons.person),
                                                      title: Text("full name"),
                                                      subtitle:
                                                      Text('${user?.name}'),
                                                    ),
                                                    ListTile(
                                                      leading:
                                                      Icon(Icons.email),
                                                      title: Text("Email"),
                                                      subtitle: Text(
                                                          "${user?.email}"),
                                                    ),
                                                    ListTile(
                                                      leading:
                                                      Icon(Icons.phone),
                                                      title: Text("Phone"),
                                                      subtitle: Text(
                                                          "${user?.phone}"),
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
              }),
        );
      },
    );
  }
}
