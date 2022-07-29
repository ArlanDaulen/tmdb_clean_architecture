import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/result.dart';
import 'package:tmdb_clean_architecture/shared/widgets/vote_average.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/routes/router.gr.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class MoviesOrTvWrap extends StatelessWidget {
  const MoviesOrTvWrap({Key? key, this.movies, this.series}) : super(key: key);
  final List<MovieResult>? movies;
  final List<TvResult>? series;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        runSpacing: 10,
        children: List.generate(
            movies != null ? movies!.length : series!.length, (index) {
          final movie = movies != null ? movies![index] : null;
          final serie = series != null ? series![index] : null;
          String? month;
          if (movie != null) {
            month = movie.releaseDate.isEmpty
                ? 'No Date'
                : DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(movie.releaseDate));
          } else {
            month = serie!.firstAirDate.isEmpty
                ? 'No Date'
                : DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(serie.firstAirDate));
          }

          return GestureDetector(
            onTap: () {
              if (movies != null) {
                context.router.push(MovieDetailsPageRoute(movieId: movie!.id));
              } else {
                context.router
                    .push(SeriesDetialsPageRoute(seriesId: serie!.id));
              }
            },
            child: SizedBox(
              width: size.width * 0.3,
              height: size.height * 0.3,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: movie != null
                                  ? movie.posterPath == null
                                      ? Container(
                                          width: size.width * 0.3,
                                          height: 200,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.grey,
                                          ),
                                          child: const Icon(
                                            Icons.no_photography,
                                            color: AppColors.white,
                                            size: 50,
                                          ),
                                        )
                                      : Image.network(
                                          'https://image.tmdb.org/t/p/original${movie.posterPath!}',
                                          width: size.width * 0.3,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            return Container(
                                              width: size.width * 0.3,
                                              height: 200,
                                              color: AppColors.grey
                                                  .withOpacity(0.5),
                                            );
                                          },
                                          errorBuilder: (context, child, _) {
                                            return Container(
                                              width: size.width * 0.3,
                                              height: 200,
                                              color:
                                                  Colors.red.withOpacity(0.3),
                                            );
                                          },
                                        )
                                  : serie!.posterPath == null
                                      ? Container(
                                          width: size.width * 0.3,
                                          height: 200,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: AppColors.grey,
                                          ),
                                          child: const Icon(
                                            Icons.no_photography,
                                            color: AppColors.white,
                                            size: 50,
                                          ),
                                        )
                                      : Image.network(
                                          'https://image.tmdb.org/t/p/original${serie.posterPath!}',
                                          width: size.width * 0.3,
                                          height: 200,
                                          fit: BoxFit.cover,
                                          loadingBuilder: (context, child,
                                              loadingProgress) {
                                            return Container(
                                              width: size.width * 0.3,
                                              height: 200,
                                              color: AppColors.grey
                                                  .withOpacity(0.5),
                                            );
                                          },
                                          errorBuilder: (context, child, _) {
                                            return Container(
                                              width: size.width * 0.3,
                                              height: 200,
                                              color:
                                                  Colors.red.withOpacity(0.3),
                                            );
                                          },
                                        ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                        Positioned(
                          left: 10,
                          bottom: 0,
                          child: VoteAverage(
                            voteAverage: movie != null
                                ? movie.voteAverage
                                : serie!.voteAverage,
                          ),
                        ),
                      ],
                    ),
                    DefaultText(
                      movie != null ? movie.title : serie!.name,
                      fontWeight: FontWeight.w600,
                    ),
                    DefaultText(
                      month,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
