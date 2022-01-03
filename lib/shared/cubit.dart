import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/business.dart';
import 'package:flutter_app_1/modules/science.dart';
import 'package:flutter_app_1/modules/settings.dart';
import 'package:flutter_app_1/modules/sport.dart';
import 'package:flutter_app_1/network/remote/dio_helper.dart';
import 'package:flutter_app_1/shared/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>
{
 NewsCubit() : super(NewsInitialState());

 static NewsCubit get(context) => BlocProvider.of(context);

 int currentIndex = 0;

 List<BottomNavigationBarItem> bottomItmes =
 [
  BottomNavigationBarItem(
   icon: Icon(Icons.business),
   label: 'Business',
  ),
  BottomNavigationBarItem(
   icon: Icon(Icons.sports),
   label: 'Sports',
  ),
  BottomNavigationBarItem(
   icon: Icon(Icons.science),
   label: 'Science',
  ),
  BottomNavigationBarItem(
   icon: Icon(Icons.settings),
   label: 'Settings',
  ),
 ];

 List <Widget> screens = [
  BusinessScreen(),
  SportScreen(),
  ScienceScreen(),
  SettingsScreen(),
 ];

 void changeBottomNav (int index){
  currentIndex = index;
  emit(NewsBottomNavState());
}

 List<dynamic> business = [];

 void getBusiness()
 {
  emit(NewsLoadingState());
  DioHelper.getData(
      url: 'v2/everything',
      query: {
       'q':'tesla',
       'from':'2021-12-02',
       'sortBy':'publishedAt',
       'apiKey':'d67997c8467143f0b8beee2421b0984b',
      }
  ).then((value) {
   // print(value.data['totalResult']);
   business = value.data['articles'];
   print(business[0]['title']);
   emit(NewsGetBusinessSuccessState());
  }
  ).catchError((error){
   print(error.toString());
   emit(NewsGetBusinessErrorState(error.toString()));
  });
 }
}