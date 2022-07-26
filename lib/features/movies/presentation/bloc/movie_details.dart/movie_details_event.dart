abstract class MovieDetailsEvent {}

class LoadMovieDetails extends MovieDetailsEvent {
  final int movieId;
  LoadMovieDetails({required this.movieId});
}
