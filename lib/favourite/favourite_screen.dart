
import 'package:final_project/favourite/cubit_favourite.dart';
import 'package:final_project/favourite/states_favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit,FavoriteStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit=FavoriteCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:const  Text('favorites'),
          ),
          body:   cubit.favorites.isNotEmpty?
          ListView.separated(padding: const EdgeInsets.all(8),itemBuilder: (context,index){


            return Container(
              color: Colors.grey[300],
              child: ListTile(

                leading: Image(image: AssetImage(cubit.favorites[index].image,)),
                title: Text(
                  cubit.favorites[index].name,
                ),
                subtitle: Text(cubit.favorites[index].discription),
                trailing:
                InkWell(
                    child:
                    const Icon(Icons.delete,color: Colors.red,size: 30)
                    ,
                    onTap: ()
                    {
                      cubit.favorites[index].fav=false;
                      cubit.removeFavProduct(cubit.favorites[index]);
                    }),
              ),
            );
          }, separatorBuilder: (context,index){
            return const Divider();
          }, itemCount: cubit.favorites.length):Center(child: Image.network(
              'https://img.freepik.com/premium-vector/wishlist_203633-574.jpg?w=740'),
          ),
        );
      },
    );
  }
}
