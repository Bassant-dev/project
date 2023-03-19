// import 'package:final_project/new_layout/cubit_new_layout.dart';
// import 'package:final_project/shared/cache_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../start_3screens/register_screen/cubit.register.dart';
// import '../start_3screens/register_screen/states.register.dart';
//
// Widget signout(context) {
//   return TextButton(
//     onPressed: () {
//       CacheHelper.removeData(key: 'token').then((value) {
//         // Navigator.pushAndRemoveUntil(context,
//         //     MaterialPageRoute(builder: (context) {
//         //       return login();
//         //     }), (route) => false);
//       });
//     },
//     child: Text(
//       "sign out",
//       style: TextStyle(fontSize: 20),
//     ),
//   );
// }
//
// String? token = CacheHelper.getData(key: 'token');
//
// SocialRegisterStates bloc2(context) {
//   var bloc = BlocProvider.of<SocialRegisterStates>(context);
//   return bloc;
// }
// String? uid='';