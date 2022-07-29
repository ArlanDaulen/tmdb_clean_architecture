import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/result.dart';
import 'package:tmdb_clean_architecture/shared/widgets/vote_average.dart';
import 'package:tmdb_clean_architecture/features/series/domain/entities/tv.dart';
import 'package:tmdb_clean_architecture/routes/router.gr.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:intl/intl.dart';

class MovieOrTvListView extends StatelessWidget {
  const MovieOrTvListView({
    Key? key,
    this.movies,
    this.tvs,
    required this.isMovie,
    required this.isReplace,
  }) : super(key: key);
  final List<MovieResult>? movies;
  final List<TvResult>? tvs;
  final bool isMovie;
  final isReplace;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: isMovie ? movies!.length : tvs!.length,
      separatorBuilder: (_, index) => const SizedBox(width: 10),
      itemBuilder: (_, index) {
        final movie = isMovie ? movies![index] : null;
        final tv = !isMovie ? tvs![index] : null;
        String? month;
        if (isMovie) {
          month = movie!.releaseDate.isEmpty
              ? 'No Date'
              : DateFormat('dd MMMM yyyy')
                  .format(DateTime.parse(movie.releaseDate));
        } else {
          month = tv!.firstAirDate.isEmpty
              ? 'No Date'
              : DateFormat('dd MMMM yyyy')
                  .format(DateTime.parse(tv.firstAirDate));
        }
        return GestureDetector(
          onTap: () {
            if (isMovie) {
              isReplace
                  ? context.router
                      .replace(MovieDetailsPageRoute(movieId: movie!.id))
                  : context.router
                      .push(MovieDetailsPageRoute(movieId: movie!.id));
            } else {
              isReplace
                  ? context.router
                      .replace(SeriesDetialsPageRoute(seriesId: tv!.id))
                  : context.router
                      .push(SeriesDetialsPageRoute(seriesId: tv!.id));
            }
          },
          child: SizedBox(
            width: 150,
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
                            child: isMovie
                                ? movie!.posterPath == null
                                    ? Container(
                                        width: 150,
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
                                        'https://image.tmdb.org/t/p/original/${movie.posterPath!}',
                                        width: 150,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
                                          return Container(
                                            width: 150,
                                            height: 200,
                                            color:
                                                AppColors.grey.withOpacity(0.5),
                                          );
                                        },
                                      )
                                : tv!.posterPath == null
                                    ? Container(
                                        width: 150,
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
                                        'https://image.tmdb.org/t/p/original/${tv.posterPath}',
                                        width: 150,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          return Container(
                                            width: 150,
                                            height: 200,
                                            color:
                                                AppColors.grey.withOpacity(0.5),
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
                          voteAverage:
                              isMovie ? movie!.voteAverage : tv!.voteAverage,
                        ),
                      ),
                    ],
                  ),
                  DefaultText(
                    isMovie ? movie!.title : tv!.name,
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
      },
    );
  }

  Color _identifyColor(num voteAverage) {
    if (voteAverage >= 7.5) {
      return Colors.green;
    } else if (voteAverage < 7.5 && voteAverage >= 5) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
