import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/core/colors.dart';
import 'package:task_app/features/home/presentation/cubit/home_cubit.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return BottomNavigationBar(
        
            onTap: (index) {
              homeCubit.changeBottomNavBar(index);
            },
            currentIndex: homeCubit.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorsManager.darkBlueColor,
            selectedItemColor: ColorsManager.whiteColor,
            unselectedItemColor: ColorsManager.greyColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 16,
            selectedIconTheme: const IconThemeData(
              size: 28,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add_check),
                label: "ToDayDo",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.playlist_add_check_circle_outlined,
                ),
                label: "Done",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.archive_outlined),
                label: "Archived",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.note_add_outlined),
                label: "Notes",
              ),
            ]);
      },
    );
  }
}
