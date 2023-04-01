import 'package:final_project/dark/cubit_dark.dart';
import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/new_layout/states_new_layout.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../start_3screens/register_screen/cubit.register.dart';
import '../start_3screens/register_screen/states.register.dart';


class ShopLayOut extends StatelessWidget {
  const ShopLayOut({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit()
        ,
      child: BlocConsumer<SocialCubit,SocialStates>(
        listener: (context, state) {},
        builder: (context, state) {
          SocialCubit bloc1 =SocialCubit.get(context);

          return Scaffold(

            // appBar: AppBar(


            //   actions: [
            //     IconButton(
            //     icon: Icon(Icons.brightness_4_outlined),
            //         onPressed: () {
            //
            //             CubitDark.get(context).changeAppMode();
            //         },
            //
            //     )
            //   ],
            // ),
            body: bloc1.Home_widget[bloc1.current],
            bottomNavigationBar: Container(
              // margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color:  Colors.blue[300],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 8,
                        blurRadius: 6,
                        offset: Offset(0, 4))
                  ]),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                items: bloc1.Bottom_Nav,
                currentIndex: bloc1.current,
                onTap: (index) {
                  bloc1.changeItem(index);
                },
              ),
            ),
            floatingActionButton: bloc1.current == 3
                ? FloatingActionButton(
              onPressed: () {

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => updateProfile()
                //     ));
              },
              child: Icon(Icons.edit),
            )
                : null,
          );
        },
      ),
    );
  }
}
