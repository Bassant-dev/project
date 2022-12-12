
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/shared/usermodel.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(SocialRegisterLoadingState());

    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      UserCreate(
          uid: value.user!.uid,
          phone: phone,
          email: email,
          name: name,
      );


    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
    });
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
      emit(SocialCreateUserSuccessState());
    }).catchError((error){
      emit(SocialCreateUserErrorState(error.toString()));
    });

  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off ;

    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
