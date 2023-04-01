
import 'dart:convert';

import 'package:final_project/categorymodel.dart';
import 'package:final_project/constant/constant.dart';
import 'package:final_project/new_layout/items.dart';
import 'package:final_project/new_layout/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../category.dart';
import '../classic.dart';
import '../shared/cache_helper.dart';
import '../shared/components.dart';
import '../sport.dart';
import '../start_3screens/register_screen/cubit.register.dart';
import '../start_3screens/register_screen/states.register.dart';


class ProductsScreen extends StatelessWidget
{
  String ?uId;
  ProductsScreen({ required this.uId});

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
                    "AR",
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

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 25,),

                        Text(
                          'CATEGORIES',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Categories(),
                  ),
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


                          itemCount: cubit.products.length,itemBuilder:(context,index){
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
                                        backgroundImage:AssetImage(cubit.products[index].image,),

                                      )
                                     // child: Image.asset(cubit.products[index].image,height: 100,width: 130,),

                                    ),
                                  ),
                                  Row(
                                    children: [

                                      Container(
                                        padding: EdgeInsets.only(bottom: 8),
                                        alignment: Alignment.centerLeft,child: Text( cubit.products[index].name,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

                                      ),
                                      SizedBox(width:40,),
                                      InkWell(
                                          child:
                                          cubit.products[index].fav?
                                          Icon(Icons.favorite,size: 30,color:Colors.red,):
                                          Icon(Icons.favorite_border_sharp,size: 30,)
                                          ,
                                          onTap: ()
                                          {

                                            cubit.isFavorites(cubit.products[index],uid,cubit.products[index].name);


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


class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: demo_categories.length,
        itemBuilder: (context, index) => CategoryCard(
          icon: demo_categories[index].icon,
          title:demo_categories[index].title,
          press: () {
            if(index==0){
// navigateto(context, items2());
            }
            else if(index==1){
              navigateto(context, classicScreen(uId:uid ));
            }
            else if(index==2){

            }
            else if(index==3){
              navigateto(context, sportScreen(uId:uid ));
            }
          },
        ),
        separatorBuilder: (context, index) =>
        const SizedBox(width: defaultPadding),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: press,
      style: OutlinedButton.styleFrom(
        backgroundColor:  Colors.blue[300],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: defaultPadding / 2, horizontal: defaultPadding /4),
        child: Column(
          children: [
            //SvgPicture.asset(icon),
            Container(
              height: 80,
              width: 80,
              child:CircleAvatar(
                radius: 25,
                backgroundImage:AssetImage(icon),

              ),),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}




