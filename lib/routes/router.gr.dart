// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../features/movies/presentation/pages/movie_details_page.dart' as _i7;
import '../features/movies/presentation/pages/movies_page.dart' as _i6;
import '../features/movies/presentation/pages/movies_wrapper.dart' as _i2;
import '../features/others/presentation/pages/menu_page.dart' as _i5;
import '../features/people/presentation/pages/people_details_page.dart' as _i9;
import '../features/people/presentation/pages/people_page.dart' as _i4;
import '../features/series/presentation/pages/series_details_page.dart' as _i8;
import '../features/series/presentation/pages/series_page.dart' as _i3;
import '../home_page.dart' as _i1;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    MoviesWrapperRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.MoviesWrapper());
    },
    SeriesPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SeriesPage());
    },
    PeoplePageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PeoplePage());
    },
    MenuPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MenuPage());
    },
    MoviesPageRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.MoviesPage());
    },
    MovieDetailsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MovieDetailsPageRouteArgs>(
          orElse: () =>
              MovieDetailsPageRouteArgs(movieId: pathParams.getInt('movieId')));
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.MovieDetailsPage(key: args.key, movieId: args.movieId));
    },
    SeriesDetialsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<SeriesDetialsPageRouteArgs>(
          orElse: () => SeriesDetialsPageRouteArgs(
              seriesId: pathParams.getInt('seriesId')));
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.SeriesDetialsPage(key: args.key, seriesId: args.seriesId));
    },
    PeopleDetailsPageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<PeopleDetailsPageRouteArgs>(
          orElse: () => PeopleDetailsPageRouteArgs(
              peopleId: pathParams.getInt('peopleId')));
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.PeopleDetailsPage(key: args.key, peopleId: args.peopleId));
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(HomePageRoute.name, path: '/', children: [
          _i10.RouteConfig(MoviesWrapperRoute.name,
              path: 'movies',
              parent: HomePageRoute.name,
              children: [
                _i10.RouteConfig(MoviesPageRoute.name,
                    path: '', parent: MoviesWrapperRoute.name),
                _i10.RouteConfig(MovieDetailsPageRoute.name,
                    path: ':movieId', parent: MoviesWrapperRoute.name)
              ]),
          _i10.RouteConfig(SeriesPageRoute.name,
              path: 'series',
              parent: HomePageRoute.name,
              children: [
                _i10.RouteConfig(SeriesDetialsPageRoute.name,
                    path: ':seriesId', parent: SeriesPageRoute.name)
              ]),
          _i10.RouteConfig(PeoplePageRoute.name,
              path: 'people',
              parent: HomePageRoute.name,
              children: [
                _i10.RouteConfig(PeopleDetailsPageRoute.name,
                    path: ':peopleId', parent: PeoplePageRoute.name)
              ]),
          _i10.RouteConfig(MenuPageRoute.name,
              path: 'menu', parent: HomePageRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i10.PageRouteInfo<void> {
  const HomePageRoute({List<_i10.PageRouteInfo>? children})
      : super(HomePageRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.MoviesWrapper]
class MoviesWrapperRoute extends _i10.PageRouteInfo<void> {
  const MoviesWrapperRoute({List<_i10.PageRouteInfo>? children})
      : super(MoviesWrapperRoute.name,
            path: 'movies', initialChildren: children);

  static const String name = 'MoviesWrapperRoute';
}

/// generated route for
/// [_i3.SeriesPage]
class SeriesPageRoute extends _i10.PageRouteInfo<void> {
  const SeriesPageRoute({List<_i10.PageRouteInfo>? children})
      : super(SeriesPageRoute.name, path: 'series', initialChildren: children);

  static const String name = 'SeriesPageRoute';
}

/// generated route for
/// [_i4.PeoplePage]
class PeoplePageRoute extends _i10.PageRouteInfo<void> {
  const PeoplePageRoute({List<_i10.PageRouteInfo>? children})
      : super(PeoplePageRoute.name, path: 'people', initialChildren: children);

  static const String name = 'PeoplePageRoute';
}

/// generated route for
/// [_i5.MenuPage]
class MenuPageRoute extends _i10.PageRouteInfo<void> {
  const MenuPageRoute() : super(MenuPageRoute.name, path: 'menu');

  static const String name = 'MenuPageRoute';
}

/// generated route for
/// [_i6.MoviesPage]
class MoviesPageRoute extends _i10.PageRouteInfo<void> {
  const MoviesPageRoute() : super(MoviesPageRoute.name, path: '');

  static const String name = 'MoviesPageRoute';
}

/// generated route for
/// [_i7.MovieDetailsPage]
class MovieDetailsPageRoute
    extends _i10.PageRouteInfo<MovieDetailsPageRouteArgs> {
  MovieDetailsPageRoute({_i11.Key? key, required int movieId})
      : super(MovieDetailsPageRoute.name,
            path: ':movieId',
            args: MovieDetailsPageRouteArgs(key: key, movieId: movieId),
            rawPathParams: {'movieId': movieId});

  static const String name = 'MovieDetailsPageRoute';
}

class MovieDetailsPageRouteArgs {
  const MovieDetailsPageRouteArgs({this.key, required this.movieId});

  final _i11.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsPageRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i8.SeriesDetialsPage]
class SeriesDetialsPageRoute
    extends _i10.PageRouteInfo<SeriesDetialsPageRouteArgs> {
  SeriesDetialsPageRoute({_i11.Key? key, required int seriesId})
      : super(SeriesDetialsPageRoute.name,
            path: ':seriesId',
            args: SeriesDetialsPageRouteArgs(key: key, seriesId: seriesId),
            rawPathParams: {'seriesId': seriesId});

  static const String name = 'SeriesDetialsPageRoute';
}

class SeriesDetialsPageRouteArgs {
  const SeriesDetialsPageRouteArgs({this.key, required this.seriesId});

  final _i11.Key? key;

  final int seriesId;

  @override
  String toString() {
    return 'SeriesDetialsPageRouteArgs{key: $key, seriesId: $seriesId}';
  }
}

/// generated route for
/// [_i9.PeopleDetailsPage]
class PeopleDetailsPageRoute
    extends _i10.PageRouteInfo<PeopleDetailsPageRouteArgs> {
  PeopleDetailsPageRoute({_i11.Key? key, required int peopleId})
      : super(PeopleDetailsPageRoute.name,
            path: ':peopleId',
            args: PeopleDetailsPageRouteArgs(key: key, peopleId: peopleId),
            rawPathParams: {'peopleId': peopleId});

  static const String name = 'PeopleDetailsPageRoute';
}

class PeopleDetailsPageRouteArgs {
  const PeopleDetailsPageRouteArgs({this.key, required this.peopleId});

  final _i11.Key? key;

  final int peopleId;

  @override
  String toString() {
    return 'PeopleDetailsPageRouteArgs{key: $key, peopleId: $peopleId}';
  }
}
