
import 'package:flutter/material.dart';
import 'package:flutter_app_1/network/remote/dio_helper.dart';
import 'package:flutter_app_1/shared/cubit.dart';
import 'package:flutter_app_1/shared/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer <NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){

          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News APP'),
              actions: [IconButton(onPressed: (){}, icon: Icon(Icons.search))],
            ),
            bottomNavigationBar :BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index)
                {
                  cubit.changeBottomNav(index);
                },
                items: cubit.bottomItmes),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
