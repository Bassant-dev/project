import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/shared/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget signout(context) {
  return TextButton(
    onPressed: () {
      CacheHelper.removeData(key: 'token').then((value) {
        // Navigator.pushAndRemoveUntil(context,
        //     MaterialPageRoute(builder: (context) {
        //       return login();
        //     }), (route) => false);
      });
    },
    child: Text(
      "sign out",
      style: TextStyle(fontSize: 20),
    ),
  );
}

String? token = CacheHelper.getData(key: 'token');

ShopCubit bloc2(context) {
  var bloc = BlocProvider.of<ShopCubit>(context);
  return bloc;
}
