import 'package:final_project/dark/state_cubit.dart';

import 'package:final_project/shared/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CubitDark extends Cubit<StatesDark> {
  CubitDark() : super(InitialStatesDark());


  static CubitDark get(context) => BlocProvider.of(context);

  bool isDark = false;
  ThemeMode appMode = ThemeMode.dark;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeState());
    }
    else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(ChangeModeState());
      }).catchError((error){
        ChangeModeStateFail(error.toString());
      });
    }
  }
}
