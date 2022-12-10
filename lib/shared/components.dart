
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
          color: Colors.white
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
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.white,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: Colors.black,
      ),),
    labelText: (label),
    prefixIcon:Icon(prifex),
    suffixIcon: suffix !=null ? IconButton(
      color: Colors.black12,
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
