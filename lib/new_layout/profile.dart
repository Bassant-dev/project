import 'package:final_project/new_layout/cubit_new_layout.dart';
import 'package:final_project/new_layout/states_new_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return Scaffold(
          appBar: AppBar(),
          body: Text(
            'HELLOO'
          ),
        );
      },
    );
  }
}

