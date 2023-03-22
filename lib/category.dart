import 'package:final_project/shared/components.dart';
import 'package:flutter/material.dart';


import 'categorymodel.dart';
import 'constant/constant.dart';

import 'new_layout/test.dart';




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

            }
            else if(index==2){

            }
            else if(index==3){

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