
import 'package:final_project/shared/bloc_observer.dart';
import 'package:final_project/start_3screens/login_screen/cubit_login.dart';

import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:final_project/start_3screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer= MyBlocObserver();
  await Firebase.initializeApp();



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context)=>SocialRegisterCubit()),
      BlocProvider(create: (BuildContext context)=>SocialLoginCubit())
    ],
        child:MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));

  }
}

