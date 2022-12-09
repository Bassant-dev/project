
import 'package:final_project/shared/bloc_observer.dart';
import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:final_project/start_3screens/register_screen/states.register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'start_3screens/register_screen/register_screen.dart';

void main() {
  Bloc.observer= MyBlocObserver();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context)=>SocialRegisterCubit()),
    ],
        child:BlocConsumer<SocialRegisterCubit, SocialRegisterStates>(
          listener: (context,state){},
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home:Register_Screen(),
            );
          },

    ));

  }
}

