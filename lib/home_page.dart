import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/routes/router.gr.dart';
import 'package:tmdb_clean_architecture/shared/constants/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          _identifyAppBarTitle(tabsRouter.activeIndex),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        leading: const AutoLeadingButton(),
      ),
      bottomNavigationBuilder: (_, tabsRouter) => AnimatedBottomNavigationBar(
        gapLocation: GapLocation.none,
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        backgroundColor: AppColors.primary,
        icons: const [Icons.movie, Icons.tv, Icons.person, Icons.menu],
        activeIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
      ),
      routes: const [
        MoviesWrapperRoute(),
        SeriesPageRoute(),
        PeoplePageRoute(),
        MenuPageRoute(),
      ],
    );
  }

  String _identifyAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'Movies';
      case 1:
        return 'Series';
      case 2:
        return 'Persons';
      case 3:
        return 'Menu';
      default:
        return '';
    }
  }
}
