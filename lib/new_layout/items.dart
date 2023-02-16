
import 'package:flutter/material.dart';

class items extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return GridView.count(
       childAspectRatio: 0.68,
      //physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15,right: 10),
          margin: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
          decoration: BoxDecoration
            (
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){},icon: Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                       ))
                  ],
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    margin: EdgeInsets.all(7),
                    child: Image.asset('assets/img/watch1.jpg',height: 100,width: 120,),

                  ),
                ),
                 Container(
                    padding: EdgeInsets.only(bottom: 8),
                   alignment: Alignment.centerLeft,child: Text('watch name',style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("description",style: TextStyle(fontSize: 15,color: Colors.grey,),maxLines: 1,
                )
                ),
                SizedBox(height: 5,),
               Container(
                   height: 40.0,
                   width: double.infinity,
                   color: Colors.blue,


                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: MaterialButton(onPressed: (){},child: Text('Try On',style: TextStyle(color: Colors.white),) ,),
                   ))
              ],
            ),
          ),

        ),


      ],
    );
  }
}
