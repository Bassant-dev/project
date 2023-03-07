
import 'package:bloc/bloc.dart';
import 'package:final_project/favourite/states_favourite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoritesInitialState());
  static FavoriteCubit get(context) => BlocProvider.of(context);
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
    UserModel(fav: false,
      name: 'watch 1', image: 'assets/img/watch1.jpg', discription: 'available',
    ),
    UserModel(
        name: 'watch2', image: 'assets/img/watch1.jpg', discription: 'available',fav: false),
    UserModel(
      name: 'watch3', image: 'assets/img/watch1.jpg', discription: 'not available',
      fav: false,
    ),
  ];

  List<UserModel>favorites=[];

  bool isFavorites(UserModel model)
  {
    model.fav=!model.fav;

    if(model.fav==true )
    {
      favorites.add(model);
    }
    else if(model.fav==false && favorites.contains(model))
    {
      favorites.remove(model);
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
class UserModel{
  String name;
  String discription;
  String image;
  bool fav;

  UserModel({required this.fav,
    required this.name,required this.image,required this.discription});
}