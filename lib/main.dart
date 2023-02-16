import 'package:final_project/dark/state_cubit.dart';
import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/new_layout/home_screen.dart';
import 'package:final_project/new_layout/states_new_layout.dart';
import 'package:final_project/shared/bloc_observer.dart';
import 'package:final_project/shared/cache_helper.dart';
import 'package:final_project/shared/dio_helper.dart';
import 'package:final_project/start_3screens/login_screen/cubit_login.dart';
import 'package:final_project/start_3screens/register_screen/cubit.register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dark/cubit_dark.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.Init_dio();
  await CacheHelper.init();
   await Firebase.initializeApp();
  bool ? isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  // constructor
  // build
  final bool ? isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ,
        ),

        BlocProvider(create: (context) => CubitDark()..changeAppMode(
            fromShared: isDark
        ),),

        BlocProvider(create: (BuildContext context)=>SocialRegisterCubit()),
        BlocProvider(create: (BuildContext context)=>SocialLoginCubit()),



      ],



          // child : BlocConsumer<CubitDark,StatesDark>(
          //   listener: (context, state) {},
          //   builder: (context, state) {
              child: BlocConsumer<CubitDark,StatesDark>(
                listener: (context, state) {},
                builder: (context, state) {
                return
      BlocConsumer<ShopCubit, ShopLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),

                  backgroundColor: Colors.white,
                  elevation: 0.0,

                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                ),

                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                      fixedSize: Size(70, 70),
                      shape: CircleBorder()),
                ),

                floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: Colors.blue,
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.black,
                  elevation: 20.0,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  subtitle2: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.blue,
                  scaffoldBackgroundColor: HexColor('333739'),
                  appBarTheme: AppBarTheme(
                    titleSpacing: 20.0,
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                  ),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.blue,
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.white,
                    elevation: 20.0,
                    backgroundColor: HexColor('333739'),
                  ),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    subtitle2: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(120, 120),
                        shape: CircleBorder()),
                  ),
                  buttonTheme: ButtonThemeData(

                  )
              ),
              themeMode: CubitDark
                  .get(context)
                  .isDark ? ThemeMode.dark : ThemeMode.light,
              home: ShopLayOut()
          );
        },

      );
    }
              ),







    );


  }
}
