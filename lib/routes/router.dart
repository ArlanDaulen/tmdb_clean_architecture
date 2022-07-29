import 'package:auto_route/auto_route.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/pages/home_page.dart';
import 'package:tmdb_clean_architecture/features/home/presentation/pages/home_wrapper.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/pages/movies_wrapper.dart';
import 'package:tmdb_clean_architecture/features/others/presentation/pages/menu_page.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/pages/movie_details_page.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/pages/movies_page.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/pages/people_details_page.dart';
import 'package:tmdb_clean_architecture/features/people/presentation/pages/people_page.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/pages/series_details_page.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/pages/series_page.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/pages/series_wrapper.dart';
import 'package:tmdb_clean_architecture/home_screen.dart';

@MaterialAutoRouter(
  // replaceInRouteName: 'Page, Route',
  routes: [
    AutoRoute(
      page: HomeScreen,
      initial: true,
      children: [
        AutoRoute(
          path: 'home',
          page: HomeWrapper,
          children: [
            AutoRoute(path: '', page: HomePage),
            AutoRoute(path: ':movieId', page: MovieDetailsPage),
            AutoRoute(path: ':seriesId', page: SeriesDetialsPage),
          ],
        ),
        AutoRoute(
          path: 'movies',
          page: MoviesWrapper,
          children: [
            AutoRoute(path: '', page: MoviesPage),
            AutoRoute(path: ':movieId', page: MovieDetailsPage),
          ],
        ),
        AutoRoute(
          path: 'series',
          page: SeriesWrapper,
          children: [
            AutoRoute(path: '', page: SeriesPage),
            AutoRoute(path: ':seriesId', page: SeriesDetialsPage),
          ],
        ),
        AutoRoute(
          path: 'people',
          page: PeoplePage,
          children: [
            AutoRoute(path: ':peopleId', page: PeopleDetailsPage),
          ],
        ),
        AutoRoute(path: 'menu', page: MenuPage),
      ],
    )
  ],
)
class $AppRouter {}
