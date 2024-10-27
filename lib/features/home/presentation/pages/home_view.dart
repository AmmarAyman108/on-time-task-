import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:task_app/features/home/presentation/widgets/home_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return homeCubit.screens[homeCubit.currentIndex];
          },
        ),
      ),
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
