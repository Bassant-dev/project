import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../favourite/favourite_screen.dart';
import '../../new_layout/product.dart';
import '../../new_layout/profile.dart';
import '../../shared/cache_helper.dart';
import '../../shared/usermodel.dart';


String uid='';

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialRegisterInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  SocialUserModel? model;

  void userLogin({
    required String email,
    required String password,
  }) {


    emit(SocialLoginLoadingState());

    FirebaseAuth.instance.signInWithEmailAndPassword(
        email:email,
        password: password).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      uid=CacheHelper.getData(key: "uid");
      emit(SocialLoginSuccessState(value.user!.uid));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off ;

    emit(SocialLoginChangePasswordVisibilityState());
  }
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
      CacheHelper.saveData(key: "uid", value:value.user!.uid);
      uid=value.user!.uid;

      UserCreate(
        uid:uid,
        phone: phone,
        email: email,
        name: name,
      );
    }).catchError((error) {
      emit(SocialRegisterErrorState(error.toString()));
    });
  }

  List<Widget> Home_widget = [
    ProductsScreen(uId: uid ),
    FavouriteScreen(uId: uid,),
    ProfileScreen()

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
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(SocialCreateUserSuccessState());
    }).catchError((error) {
      emit(SocialCreateUserErrorState(error.toString()));
    });
  }

  IconData suffix2 = Icons.visibility_outlined;
  bool isPassword2 = true;

  void changePasswordVisibility2() {
    isPassword2 = !isPassword;
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
  List<UserModel>products_classic = [
    UserModel(fav: false,
      name: 'watch 6', image: 'assets/img/watch1.jpg', discription: 'available',
    ),
    UserModel(
        name: 'watch 7', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModel(
      name: 'watch 8', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch 9', image: 'assets/img/watch1.jpg',discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch 10', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
  ];

  List<UserModel>products_smart = [
    UserModel(fav: false,
      name: 'watch 11', image: 'assets/img/watch1.jpg', discription: 'available',
    ),
    UserModel(
        name: 'watch 12', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModel(
      name: 'watch 13', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch 14', image: 'assets/img/watch1.jpg',discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch 15', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
  ];


  List<UserModel>products_sport = [
    UserModel(fav: false,
      name: 'watch 16', image: 'assets/img/watch1.jpg', discription: 'available',
    ),
    UserModel(
        name: 'watch 17', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModel(
      name: 'watch 18', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch 19', image: 'assets/img/watch1.jpg',discription: 'not available',
      fav: false,
    ),
    UserModel(
      name: 'watch 20', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
  ];

  List<UserModel>favorites=[];


  bool isFavorites(UserModel model,email,productName)
  {
    model.fav=!model.fav;

    if(model.fav==true )
    {
      favorites.add(model);

      FirebaseFirestore.instance.collection('users').doc(uid).set({'fav':FieldValue.arrayUnion([productName])},SetOptions(merge: true));
    }
    else if(model.fav==false && favorites.contains(model))
    {
      favorites.remove(model);
      FirebaseFirestore.instance.collection('users').doc(uid).set({'fav':FieldValue.arrayRemove([productName])},SetOptions(merge: true));

    }

    print(model.fav);
    print(favorites.length);
    emit(FavoritesSuccessfully());

    return model.fav;
  }

  void removeFavProduct(model,user2,productName)
  {
    favorites.remove(model);
    FirebaseFirestore.instance.collection('users').doc(user2).set({'fav':FieldValue.arrayRemove([productName])},SetOptions(merge: true));

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
