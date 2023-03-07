

import 'package:final_project/favourite/cubit_favourite.dart';
import 'package:final_project/favourite/states_favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCubit, FavoriteStates>(
      builder: (context, state) {
        var cubit = FavoriteCubit.get(context);
        return Scaffold(
body:
Column(
children: [
Padding(
padding: const EdgeInsets.only(left: 8, bottom: 8),
child: Text(
"New Product",
style: TextStyle(
color:Colors.lightBlue, fontSize: 25, fontWeight: FontWeight.w600),
),
),
SizedBox(
height: 10,
),
        Expanded(
            child: Container(

              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 20,
                crossAxisSpacing:20,childAspectRatio: 0.6,),
                  //scrollDirection: Axis.vertical,

                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  primary: true,
                   physics: BouncingScrollPhysics(),


                  itemCount: cubit.products.length,itemBuilder:(context,index){
                    return Container(



                     padding:EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      margin: EdgeInsets.symmetric(vertical: 2,horizontal:10),
                      decoration: BoxDecoration
                        (

                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  child:
                                  cubit.products[index].fav?
                                  Icon(Icons.favorite,size: 30,color:Colors.red,):
                                  Icon(Icons.favorite_border_sharp,size: 30,)
                                  ,
                                  onTap: ()
                                  {
                                    cubit.isFavorites(cubit.products[index]);
                                  }),
                            ],
                          ),
                          InkWell(
                            onTap: (){},
                            child: Container(
                              margin: EdgeInsets.all(7),
                              child: Image.asset(cubit.products[index].image,height: 150,width: 170,),

                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 8),
                            alignment: Alignment.centerLeft,child: Text( cubit.products[index].name,style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

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
                              color: Colors.lightBlueAccent,


                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: MaterialButton(onPressed: (){},child: Text('Try On',style: TextStyle(color: Colors.white),) ,),
                              ))

                        ],
                      ),


                    );

                  }

                  ),
            ),
          ),


],
),

);

      },
      listener: (context, state) {

      },
    );
  }
}
