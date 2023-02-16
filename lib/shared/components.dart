
import 'package:conditional_builder_rec/conditional_builder_rec.dart';

import 'package:flutter/material.dart';


Widget defaultButton ({
  double width=double.infinity,
  bool isUppercase=true,
  Color background = Colors.blue,
  required Function function,
  required String text,

}) => Container(

  height: 40.0,
  width: width,
  color: background,

  child: MaterialButton(

    onPressed: () {
      function();
    },
    child: Text(
      isUppercase? text.toUpperCase():text,
      style: const TextStyle(
          color: Colors.white,

      ),


    ),

  ),
);
Widget defaultAppBar({
  required BuildContext context,
  String ? title,
  List<Widget> ? actions,
})=>AppBar(
  leading: IconButton(
    onPressed: (){
      Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios_new),
  ),
  title: Text(title!),
  actions: actions,
);
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,

  required String?Function(String?)? validate,
  void Function(String)? onsubmit,
  required String label,
  required IconData prifex,
  void Function()? ontap,
  void Function(String)? onChange,
  bool isclickable=true,
  IconData? suffix,
  bool isPassword=false,
  void Function()? suffixpressed,


}
    ) =>TextFormField(

  onTap:ontap ,
  enabled: isclickable,
  onChanged : onChange,

  obscureText:isPassword,
  controller: controller,
  validator: validate,
  keyboardType: type,
  onFieldSubmitted: onsubmit,

  decoration: InputDecoration(
    fillColor: Colors.grey.shade100,
      filled: true,
    border: OutlineInputBorder(

      borderRadius: BorderRadius.circular(20),
      // borderSide: BorderSide(
      //   color: Colors.black,
      // ),focusedBorder: OutlineInputBorder(
      //     //   borderRadius: BorderRadius.circular(20)),
      //     //   // borderSide: BorderSide(
      //     //   //   color: Colors.black,
      //     //   // )),
    ),
    //
    labelText: (label),
    prefixIcon:Icon(prifex),
    suffixIcon: suffix !=null ? IconButton(

        onPressed:suffixpressed
        ,icon: Icon(suffix)) :null,
    // ignore: prefer_const_constructors

    // border: OutlineInputBorder(
    //
    //   borderRadius: BorderRadius.circular(20)
    // ),


  ),
);

void navigateto (context,widget)=>Navigator.push(context, MaterialPageRoute(builder: (context) => widget),);

Widget defaultTextButton({
  required  function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );
Widget NewsItem(article, context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: NetworkImage(
                    '${article['urlToImage']}',
                  ),
                  fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 90,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['publishedAt']}',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
Widget ListMino(list, context) {
  return ConditionalBuilderRec(
    condition: list.length > 0,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => NewsItem(list[index], context),
        separatorBuilder: (context, index) => Container(
          width: 180,
          height: 1.5,
          margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
          color: Color(0xffc2a671),
        ),
        itemCount: list.length),
    fallback: (context) => Center(
      child: CircularProgressIndicator(
        color: Color(0xffffddad),
      ),
    ),
  );
}

