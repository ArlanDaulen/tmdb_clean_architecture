// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:flutter/src/widgets/framework.dart' as _i16;

import '../features/home/presentation/pages/home_page.dart' as _i7;
import '../features/home/presentation/pages/home_wrapper.dart' as _i2;
import '../features/movies/presentation/pages/movie_details_page.dart' as _i8;
import '../features/movies/presentation/pages/movies_page.dart' as _i10;
import '../features/movies/presentation/pages/movies_wrapper.dart' as _i3;
import '../features/others/presentation/pages/menu_page.dart' as _i6;
import '../features/people/presentation/pages/people_details_page.dart' as _i13;
import '../features/people/presentation/pages/people_page.dart' as _i12;
import '../features/people/presentation/pages/people_wrapper.dart' as _i5;
import '../features/series/presentation/pages/series_details_page.dart' as _i9;
import '../features/series/presentation/pages/series_page.dart' as _i11;
import '../features/series/presentation/pages/series_wrapper.dart' as _i4;
import '../home_screen.dart' as _i1;

class AppRouter extends _i14.RootStackRouter {
  AppRouter([_i15.GlobalKey<_i15.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    HomeScreenRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    HomeWrapperRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeWrapper());
    },
    MoviesWrapperRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MoviesWrapper());
    },
    SeriesWrapperRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SeriesWrapper());
    },
    PeopleWrapperRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.PeopleWrapper());
    },
    MenuPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.MenuPage());
    },
    HomePageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomePage());
    },
    MovieDetailsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailsPageRouteArgs>(
          orElse: () =>
              MovieDetailsPageRouteArgs(movieId: pathParams.getInt('movieId')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.MovieDetailsPage(key: args.key, movieId: args.movieId));
    },
    SeriesDetialsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeriesDetialsPageRouteArgs>(
          orElse: () => SeriesDetialsPageRouteArgs(
              seriesId: pathParams.getInt('seriesId')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.SeriesDetialsPage(key: args.key, seriesId: args.seriesId));
    },
    MoviesPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.MoviesPage());
    },
    SeriesPageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.SeriesPage());
    },
    PeoplePageRoute.name: (routeData) {
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.PeoplePage());
    },
    PeopleDetailsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PeopleDetailsPageRouteArgs>(
          orElse: () => PeopleDetailsPageRouteArgs(
              peopleId: pathParams.getInt('peopleId')));
      return _i14.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i13.PeopleDetailsPage(key: args.key, peopleId: args.peopleId));
    }
  };

  @override
  List<_i14.RouteConfig> get routes => [
        _i14.RouteConfig(HomeScreenRoute.name, path: '/', children: [
          _i14.RouteConfig(HomeWrapperRoute.name,
              path: 'home',
              parent: HomeScreenRoute.name,
              children: [
                _i14.RouteConfig(HomePageRoute.name,
                    path: '', parent: HomeWrapperRoute.name),
                _i14.RouteConfig(MovieDetailsPageRoute.name,
                    path: ':movieId', parent: HomeWrapperRoute.name),
                _i14.RouteConfig(SeriesDetialsPageRoute.name,
                    path: ':seriesId', parent: HomeWrapperRoute.name)
              ]),
          _i14.RouteConfig(MoviesWrapperRoute.name,
              path: 'movies',
              parent: HomeScreenRoute.name,
              children: [
                _i14.RouteConfig(MoviesPageRoute.name,
                    path: '', parent: MoviesWrapperRoute.name),
                _i14.RouteConfig(MovieDetailsPageRoute.name,
                    path: ':movieId', parent: MoviesWrapperRoute.name)
              ]),
          _i14.RouteConfig(SeriesWrapperRoute.name,
              path: 'series',
              parent: HomeScreenRoute.name,
              children: [
                _i14.RouteConfig(SeriesPageRoute.name,
                    path: '', parent: SeriesWrapperRoute.name),
                _i14.RouteConfig(SeriesDetialsPageRoute.name,
                    path: ':seriesId', parent: SeriesWrapperRoute.name)
              ]),
          _i14.RouteConfig(PeopleWrapperRoute.name,
              path: 'people',
              parent: HomeScreenRoute.name,
              children: [
                _i14.RouteConfig(PeoplePageRoute.name,
                    path: '', parent: PeopleWrapperRoute.name),
                _i14.RouteConfig(PeopleDetailsPageRoute.name,
                    path: ':peopleId', parent: PeopleWrapperRoute.name)
              ]),
          _i14.RouteConfig(MenuPageRoute.name,
              path: 'menu', parent: HomeScreenRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreenRoute extends _i14.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i14.PageRouteInfo>? children})
      : super(HomeScreenRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i2.HomeWrapper]
class HomeWrapperRoute extends _i14.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i14.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name, path: 'home', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [_i3.MoviesWrapper]
class MoviesWrapperRoute extends _i14.PageRouteInfo<void> {
  const MoviesWrapperRoute({List<_i14.PageRouteInfo>? children})
      : super(MoviesWrapperRoute.name,
            path: 'movies', initialChildren: children);

  static const String name = 'MoviesWrapperRoute';
}

/// generated route for
/// [_i4.SeriesWrapper]
class SeriesWrapperRoute extends _i14.PageRouteInfo<void> {
  const SeriesWrapperRoute({List<_i14.PageRouteInfo>? children})
      : super(SeriesWrapperRoute.name,
            path: 'series', initialChildren: children);

  static const String name = 'SeriesWrapperRoute';
}

/// generated route for
/// [_i5.PeopleWrapper]
class PeopleWrapperRoute extends _i14.PageRouteInfo<void> {
  const PeopleWrapperRoute({List<_i14.PageRouteInfo>? children})
      : super(PeopleWrapperRoute.name,
            path: 'people', initialChildren: children);

  static const String name = 'PeopleWrapperRoute';
}

/// generated route for
/// [_i6.MenuPage]
class MenuPageRoute extends _i14.PageRouteInfo<void> {
  const MenuPageRoute() : super(MenuPageRoute.name, path: 'menu');

  static const String name = 'MenuPageRoute';
}

/// generated route for
/// [_i7.HomePage]
class HomePageRoute extends _i14.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i8.MovieDetailsPage]
class MovieDetailsPageRoute
    extends _i14.PageRouteInfo<MovieDetailsPageRouteArgs> {
  MovieDetailsPageRoute({_i16.Key? key, required int movieId})
      : super(MovieDetailsPageRoute.name,
            path: ':movieId',
            args: MovieDetailsPageRouteArgs(key: key, movieId: movieId),
            rawPathParams: {'movieId': movieId});

  static const String name = 'MovieDetailsPageRoute';
}

class MovieDetailsPageRouteArgs {
  const MovieDetailsPageRouteArgs({this.key, required this.movieId});

  final _i16.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsPageRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i9.SeriesDetialsPage]
class SeriesDetialsPageRoute
    extends _i14.PageRouteInfo<SeriesDetialsPageRouteArgs> {
  SeriesDetialsPageRoute({_i16.Key? key, required int seriesId})
      : super(SeriesDetialsPageRoute.name,
            path: ':seriesId',
            args: SeriesDetialsPageRouteArgs(key: key, seriesId: seriesId),
            rawPathParams: {'seriesId': seriesId});

  static const String name = 'SeriesDetialsPageRoute';
}

class SeriesDetialsPageRouteArgs {
  const SeriesDetialsPageRouteArgs({this.key, required this.seriesId});

  final _i16.Key? key;

  final int seriesId;

  @override
  String toString() {
    return 'SeriesDetialsPageRouteArgs{key: $key, seriesId: $seriesId}';
  }
}

/// generated route for
/// [_i10.MoviesPage]
class MoviesPageRoute extends _i14.PageRouteInfo<void> {
  const MoviesPageRoute() : super(MoviesPageRoute.name, path: '');

  static const String name = 'MoviesPageRoute';
}

/// generated route for
/// [_i11.SeriesPage]
class SeriesPageRoute extends _i14.PageRouteInfo<void> {
  const SeriesPageRoute() : super(SeriesPageRoute.name, path: '');

  static const String name = 'SeriesPageRoute';
}

/// generated route for
/// [_i12.PeoplePage]
class PeoplePageRoute extends _i14.PageRouteInfo<void> {
  const PeoplePageRoute() : super(PeoplePageRoute.name, path: '');

  static const String name = 'PeoplePageRoute';
}

/// generated route for
/// [_i13.PeopleDetailsPage]
class PeopleDetailsPageRoute
    extends _i14.PageRouteInfo<PeopleDetailsPageRouteArgs> {
  PeopleDetailsPageRoute({_i16.Key? key, required int peopleId})
      : super(PeopleDetailsPageRoute.name,
            path: ':peopleId',
            args: PeopleDetailsPageRouteArgs(key: key, peopleId: peopleId),
            rawPathParams: {'peopleId': peopleId});

  static const String name = 'PeopleDetailsPageRoute';
}

class PeopleDetailsPageRouteArgs {
  const PeopleDetailsPageRouteArgs({this.key, required this.peopleId});

  final _i16.Key? key;

  final int peopleId;

  @override
  String toString() {
    return 'PeopleDetailsPageRouteArgs{key: $key, peopleId: $peopleId}';
  }
}
