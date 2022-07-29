import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/core/error/failures.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_credits.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/images.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_keywords.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/review.dart';

abstract class MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails movie;
  final Either<Failure, MovieCredits> credits;
  final Either<Failure, Review> reviews;
  final Either<Failure, Images> images;
  final Either<Failure, Movie> recommendations;
  final Either<Failure, MovieOrTvKeywords> keywords;
  MovieDetailsLoaded({
    required this.movie,
    required this.credits,
    required this.reviews,
    required this.images,
    required this.recommendations,
    required this.keywords,
  });
}

class MovieDetailsLoadError extends MovieDetailsState {
  final String message;
  MovieDetailsLoadError({required this.message});
}
