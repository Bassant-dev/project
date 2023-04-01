
import 'package:final_project/favourite/cubit_favourite.dart';
import 'package:final_project/favourite/states_favourite.dart';
import 'package:final_project/shared/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../start_3screens/register_screen/cubit.register.dart';
import '../start_3screens/register_screen/states.register.dart';
SocialUserModel ? model;
class FavouriteScreen extends StatelessWidget
{
  String ?uId;
  FavouriteScreen({required this.uId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit=SocialCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              title:const  Text('favorites'),
              automaticallyImplyLeading: false,
            ),
            body:
            cubit.favorites.isNotEmpty?
            ListView.separated(itemBuilder: (context,index){
              return Container(
                color: Colors.grey[300],
                child: ListTile(
                  leading: Image(image: AssetImage(cubit.favorites[index].image)),
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
                        cubit.removeFavProduct(cubit.favorites[index],uid,cubit.favorites[index].name);
                      }),
                ),
              );
            }, separatorBuilder: (context,index){
              return const Divider();
            }, itemCount: cubit.favorites.length):Center(child: Image.network(
                'https://img.freepik.com/premium-vector/wishlist_203633-574.jpg?w=740'),
            ));
      },
    );
  }
}