import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/shared/components.dart';
import 'package:flutter_app_1/shared/cubit.dart';
import 'package:flutter_app_1/shared/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        return ConditionalBuilder(
          condition: state is! NewsLoadingState,
          builder: (context) =>
              ListView.separated(
                  itemBuilder: (context, index) => buildArticleItem(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10,
              ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
