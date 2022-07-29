abstract class MoviesEvent {}

class LoadPopularMovies extends MoviesEvent {}

class LoadTopRatedMovies extends MoviesEvent {}

class LoadUpcomingMovies extends MoviesEvent {}

class LoadNowPlayingMovies extends MoviesEvent {}
