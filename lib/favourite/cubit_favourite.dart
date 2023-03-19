// import 'package:bloc/bloc.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:final_project/favourite/states_favourite.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class FavoriteCubit extends Cubit<FavoriteStates> {
//   FavoriteCubit() : super(FavoritesInitialState());
//   static FavoriteCubit get(context) => BlocProvider.of(context);
//   bool isSaved=false;
//   List<UserModel>products = [
//     UserModel(fav: false,
//       name: 'watch 1', image: 'assets/img/watch1.jpg', discription: 'available',
//     ),
//     UserModel(
//         name: 'watch2', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
//     UserModel(
//       name: 'watch3', image: 'assets/img/watch1.jpg', discription: 'not available',
//       fav: false,
//     ),
//     UserModel(
//       name: 'watch4', image: 'assets/img/watch1.jpg',discription: 'not available',
//       fav: false,
//     ),
//     UserModel(
//       name: 'watch5', image: 'assets/img/watch1.jpg', discription: 'not available',
//       fav: false,
//     ),
//   ];
//
//   List<UserModel>favorites=[];
//
//   bool isFavorites(UserModel model,uId,productName)
//   {
//     model.fav=!model.fav;
//
//     if(model.fav==true )
//     {
//       favorites.add(model);
//       FirebaseFirestore.instance.collection('users').doc(uId).set({'fav':FieldValue.arrayUnion([productName])},SetOptions(merge: true));
//     }
//     else if(model.fav==false && favorites.contains(model))
//     {
//       favorites.remove(model);
//       FirebaseFirestore.instance.collection('users').doc(uId).set({'fav':FieldValue.arrayRemove([productName])},SetOptions(merge: true));
//
//     }
//
//     print(model.fav);
//     print(favorites.length);
//     emit(FavoritesSuccessfully());
//
//     return model.fav;
//   }
//   void removeFavProduct(model,uId,productName)
//   {
//     favorites.remove(model);
//     FirebaseFirestore.instance.collection('users').doc(uId).set({'fav':FieldValue.arrayRemove([productName])},SetOptions(merge: true));
//
//     emit(RemovedSuccessfully());
//   }
//
//
//
// }
// class UserModel{
//   String name;
//   String discription;
//   String image;
//   bool fav;
//
//   UserModel({required this.fav,
//     required this.name,required this.image,required this.discription});
// }