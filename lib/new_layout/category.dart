
import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/new_layout/states_new_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(

        );
      },
    );
  }

//   Widget buildCatItem(DataObject model) => Container(
//     padding: EdgeInsets.all(25),
//     child: Row(
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               image: DecorationImage(
//                 image: NetworkImage(model.image),
//                 fit: BoxFit.cover,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.grey.withOpacity(0.27),
//                     spreadRadius: 3,
//                     blurRadius: 9,
//                     offset: Offset(0, 2))
//               ]),
//         ),
//         SizedBox(
//           width: 30,
//         ),
//         Expanded(
//             child: Text(
//               model.name,
//               style: TextStyle(
//                   color:Colors.purple, fontWeight: FontWeight.w600, fontSize: 25),
//             )),
//         IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.arrow_forward_ios_rounded,
//               color:Colors.purple,
//             ))
//       ],
//     ),
//   );
 }
