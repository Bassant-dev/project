
import 'dart:convert';

import 'package:final_project/categorymodel.dart';
import 'package:final_project/constant/constant.dart';
import 'package:final_project/new_layout/items.dart';
import 'package:final_project/new_layout/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../category.dart';
import '../shared/cache_helper.dart';
import '../shared/components.dart';
import '../start_3screens/register_screen/cubit.register.dart';
import '../start_3screens/register_screen/states.register.dart';


class sportScreen extends StatelessWidget
{
  String ?uId;
  sportScreen({ required this.uId});

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit,SocialStates>(
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[300],

              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  SvgPicture.asset("assets/icons/Location.svg"),
                  const SizedBox(width:16/ 2),
                  Text(
                    "sport",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.language),
                  //
                  onPressed: (){},
                ),
              ],
            ),


            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: Container(

                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20,
                      crossAxisSpacing:15,childAspectRatio: 0.8,),
//scrollDirection: Axis.vertical,

                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        primary: true,
                        physics: BouncingScrollPhysics(),


                        itemCount: cubit.products_sport.length,itemBuilder:(context,index){
                          return Container(



                            padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                            margin: EdgeInsets.only(left: 10,right: 10,top: 5),
                            decoration: BoxDecoration
                              (

                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(

                              children: [

                                InkWell(
                                  onTap: (){},
                                  child: Container(


                                      margin: EdgeInsets.all(7),

                                      child:CircleAvatar(
                                        radius: 52,
                                        backgroundImage:AssetImage(cubit.products_sport[index].image,),

                                      )
                                    // child: Image.asset(cubit.products[index].image,height: 100,width: 130,),

                                  ),
                                ),
                                Row(
                                  children: [

                                    Container(
                                      padding: EdgeInsets.only(bottom: 8),
                                      alignment: Alignment.centerLeft,child: Text( cubit.products_sport[index].name,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

                                    ),
                                    SizedBox(width:40,),
                                    InkWell(
                                        child:
                                        cubit.products_sport[index].fav?
                                        Icon(Icons.favorite,size: 30,color:Colors.red,):
                                        Icon(Icons.favorite_border_sharp,size: 30,)
                                        ,
                                        onTap: ()
                                        {

                                          cubit.isFavorites(cubit.products_sport[index],uid,cubit.products_sport[index].name);


                                        }),
                                  ],
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(cubit.products[index].discription,style: TextStyle(fontSize: 15,color: Colors.grey,),maxLines: 1,
                                    )
                                ),
                                SizedBox(height: 8,),
                                Container(
                                    height:45.0,
                                    width: double.infinity,
                                    //color: Colors.lightBlueAccent,


                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:MaterialStateProperty.all<Color>( Colors.black87),
                                            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                                RoundedRectangleBorder(borderRadius:BorderRadius.circular(30) )
                                            )

                                        ),
                                        onPressed: (){
                                          if(index==0)
                                            navigateto(context, items());
                                          else if(index==1)
                                            navigateto(context, items2());
                                        },child: Text('Try On',style: TextStyle(color: Colors.white),) ,),
                                    ))

                              ],
                            ),


                          );

                        }

                    ),
                  ),
                ),


              ],
            )
        );
      },
      listener: (context, state) {

      },
    );
  }
}





