

import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:final_project/favourite/states_favourite.dart';
import 'package:final_project/new_layout/home_screen.dart';
import 'package:final_project/shared/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/components.dart';
import '../shared/usermodel.dart';
import '../start_3screens/register_screen/states.register.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {

  SocialUserModel ? model;
  FavoriteCubit() : super(FavoritesInitialState());

  static FavoriteCubit get(context) => BlocProvider.of(context);
  bool isSaved=false;

  List<UserModels>products = [
    UserModels(fav: false,
      name: 'watch 1', image: 'assets/img/watch1.jpg', discription: 'available',
    ),
    UserModels(
        name: 'watch2', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModels(
      name: 'watch3', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false )
    ,
    UserModels(fav: false,
      name: 'watch 1', image: 'assets/img/watch1.jpg', discription: 'available' )
    ,
    UserModels(
        name: 'watch2', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModels(
      name: 'watch3', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
  ];

  List<UserModels>favorites=[];

  bool isFavorites(UserModels model)
  {
    model.fav=!model.fav;

    if(model.fav==true )
    {
      favorites.add(model);


    }
    else if(model.fav==false && favorites.contains(model))
    {
      favorites.remove(model);
      // CollectionReference usersre=FirebaseFirestore.instance.collection("users");
      //  usersre.delete();

    }

    print(model.fav);
    print(favorites.length);
    emit(FavoritesSuccessfully());

    return model.fav;
  }
  void removeFavProduct(model)
  {
    favorites.remove(model);
    emit(RemovedSuccessfully());
  }



}
// void addToFavourite() async {
//
//
//
//   FirebaseFirestore.instance.collection("users")
//       .doc(user!.uid)
//       .collection("items")
//       .doc()
//       .set({
//     "fav": true,
//
//   }).then((value) => print("Added to favourite"));
// }
class UserModels{
  String name;
  String discription;
  String image;
  bool fav;


  UserModels({required this.fav,
    required this.name,required this.image,required this.discription});
}
void UserCreate ({
  required String name,
  required String email,
  required String uid,
  required String phone,

}){

  SocialUserModel model=SocialUserModel(
      name: name, email: email, phone: phone, uid: uid

  );
  FirebaseFirestore.instance.collection('users').doc(uid).set(
      model.toMap())
      .then((value) {

  }).catchError((error){

  });

}