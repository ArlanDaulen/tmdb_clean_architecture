import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/routes/router.gr.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: AppColors.primary,
        title: DefaultText(
          _identifyAppBarTitle(tabsRouter.activeIndex),
          color: AppColors.white,
          fontWeight: FontWeight.w600,
          size: 20,
        ),
        leading: const AutoLeadingButton(),
      ),
      bottomNavigationBuilder: (_, tabsRouter) => AnimatedBottomNavigationBar(
        gapLocation: GapLocation.none,
        activeColor: AppColors.secondary,
        inactiveColor: Colors.white,
        splashColor: AppColors.secondary,
        backgroundColor: AppColors.primary,
        icons: const [
          Icons.home,
          Icons.movie,
          Icons.tv,
          Icons.person,
          Icons.menu
        ],
        activeIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
      ),
      routes: const [
        HomeWrapperRoute(),
        MoviesWrapperRoute(),
        SeriesWrapperRoute(),
        PeoplePageRoute(),
        MenuPageRoute(),
      ],
    );
  }

  String _identifyAppBarTitle(int index) {
    switch (index) {
      case 0:
        return 'TMDB';
      case 1:
        return 'Movies';
      case 2:
        return 'Series';
      case 3:
        return 'Persons';
      case 4:
        return 'Menu';
      default:
        return '';
    }
  }
}
