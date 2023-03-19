import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/new_layout/product.dart';
import 'package:final_project/shared/constant.dart';
import 'package:final_project/shared/usermodel.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../fav.dart';
import '../../favourite/favourite_screen.dart';
import '../../new_layout/states_new_layout.dart';
dynamic user = FirebaseAuth.instance.currentUser!.uid;

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);
  SocialUserModel? model;
  String ?uid2='';

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async{
    emit(SocialRegisterLoadingState());

   FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      uid2=value.user!.uid;

      UserCreate(
        uid: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }
  List<Widget> Home_widget = [
    ProductsScreen(uId: user ),
   FavouriteScreen(uId: user,),
    ProfileScreen2()
  ];


  void UserCreate({
    required String name,
    required String email,
    required String uid,
    required String phone,
  }) {
    SocialUserModel model =
        SocialUserModel(name: name, email: email, phone: phone, uid: uid);
    FirebaseFirestore.instance
        .collection('users')
        .doc(user)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;

    emit(SocialRegisterChangePasswordVisibilityState());
  }


  List<BottomNavigationBarItem> Bottom_Nav = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'setting'),
  ];




  int current = 0;
  void changeItem(int index) {
    current = index;
    emit(ChangeBottomNavState());
  }
  bool isSaved=false;
  List<UserModel>products = [
    UserModel(fav: false,
      name: 'watch 1', image: 'assets/img/watch1.jpg', discription: 'available',
    ),
    UserModel(
        name: 'watch2', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModel(
      name: 'watch3', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch4', image: 'assets/img/watch1.jpg',discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch5', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
  ];

  List<UserModel>favorites=[];

  bool isFavorites(UserModel model,uId,productName)
  {
    model.fav=!model.fav;

    if(model.fav==true )
    {
      favorites.add(model);
      FirebaseFirestore.instance.collection('users').doc(user).set({'fav':FieldValue.arrayUnion([productName])},SetOptions(merge: true));
    }
    else if(model.fav==false && favorites.contains(model))
    {
      favorites.remove(model);
      FirebaseFirestore.instance.collection('users').doc(user).set({'fav':FieldValue.arrayRemove([productName])},SetOptions(merge: true));

    }

    print(model.fav);
    print(favorites.length);
    emit(FavoritesSuccessfully());

    return model.fav;
  }
  void removeFavProduct(model,uId,productName)
  {
    favorites.remove(model);
    FirebaseFirestore.instance.collection('users').doc(user).set({'fav':FieldValue.arrayRemove([productName])},SetOptions(merge: true));

    emit(RemovedSuccessfully());
  }



}
class UserModel{
  String name;
  String discription;
  String image;
  bool fav;

  UserModel({required this.fav,
    required this.name,required this.image,required this.discription});
}