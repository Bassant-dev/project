
import 'package:final_project/favourite/favourite_screen.dart';
import 'package:final_project/new_layout/product.dart';
import 'package:final_project/new_layout/profile.dart';

import 'package:final_project/new_layout/states_new_layout.dart';
import 'package:final_project/new_layout/test2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopCubit extends Cubit<ShopLayoutStates>{
  ShopCubit(): super(InitShopState());


  static ShopCubit get (context) =>BlocProvider.of(context);

  List<Widget> Home_widget = [
    ProductsScreen(),

    FavouriteScreen(),
    ProfileScreen()
  ];

  List<BottomNavigationBarItem> Bottom_Nav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];




  int current = 0;
  void changeItem(int index) {
    current = index;


    emit(ChangeBottomNavState());
  }








  }
