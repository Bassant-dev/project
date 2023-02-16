// import 'package:final_project/dark/cubit_dark.dart';
// import 'package:final_project/new_layout/color.dart';
// import 'package:final_project/new_layout/cubit_new_layout.dart';
// import 'package:final_project/new_layout/data.dart';
// import 'package:final_project/new_layout/states_new_layout.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
//
// class NewsLayout extends StatelessWidget {
//
//   @override
//
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context)=> NewCubit(),
//       child: BlocConsumer<NewCubit,NewsStates>(
//         listener: (context,state){},
//
//         builder:(context,state){
//           var cubit =NewCubit.get(context);
//           return Scaffold(
//
//             appBar: AppBar(
//               title: Text(
//                   'News App'
//               ),
//               actions: [
//                 // IconButton(
//                 // //     icon:Icon(Icons.search),
//                 // //     onPressed:(){
//                 // //       navigateto(context, SearchScreen(),);
//                 // //     },
//                 // // ),
//                 IconButton(
//                   icon:Icon(Icons.brightness_4_outlined),
//                   onPressed:(){
//                     CubitDark.get(context).changeAppMode();
//                   },
//                 )
//               ],
//
//
//             ),
//
//             body:
//             cubit.screens[cubit.currentIndex],
//
//
//
//               bottomNavigationBar: BottomNavigationBar(
//                 items :cubit.bottomItems,
//
//                 currentIndex: cubit.currentIndex,
//                 onTap: (index){
//                  cubit.changeBottomNavBar(index);
//                 },
//
//
//
//
//
//               ),
//
//
//           );
//         },
//       ),
//     );
//   }
// }
// //https://newsapi.org/v2/everything?q=tesla&from=2022-09-24&sortBy=publishedAt&apiKey=API_KEY
// //url:https://newsapi.org
// //method(url):v2/everything
// //query:q=tesla&from=2022-09-24&sortBy=publishedAt&apiKey=API_KEY
