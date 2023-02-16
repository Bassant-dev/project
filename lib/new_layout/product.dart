
import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/new_layout/items.dart';
import 'package:final_project/new_layout/states_new_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {
        // if (state is ShopSuccessFavoritesState) {
        //   Fluttertoast.showToast(
        //       // msg: state.model!.message,
        //       // toastLength: Toast.LENGTH_LONG,
        //       // gravity: ToastGravity.BOTTOM,
        //       // timeInSecForIosWeb: 5,
        //       // backgroundColor: Colors.green,
        //       // textColor: Colors.red,
        //       // fontSize: 16);
        // }

      },
      builder: (context, state) {

        return Scaffold(
          body:

            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                            padding: const EdgeInsets.only(left: 8, bottom: 8),
                            child: Text(
                              "New Product",
                              style: TextStyle(
                                  color:Colors.lightBlue, fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ),
                  SizedBox(
                    height: 5,
                  ),
                 items(),

                ],
              ),
            ),

        );
      },
    );
  }



 }

