import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/routes/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      appBarBuilder: (_, tabsRouter) => AppBar(
        backgroundColor: const Color.fromRGBO(7, 28, 50, 1),
        title: Text(
          tabsRouter.currentPath,
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
        backgroundColor: const Color.fromRGBO(7, 28, 50, 1),
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
}
