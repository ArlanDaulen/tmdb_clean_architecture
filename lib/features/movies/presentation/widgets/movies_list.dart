import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/result.dart';
import 'package:tmdb_clean_architecture/features/movies/presentation/widgets/vote_average.dart';
import 'package:tmdb_clean_architecture/routes/router.gr.dart';
import 'package:tmdb_clean_architecture/shared/constants/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:intl/intl.dart';

class MovieList extends StatelessWidget {
  const MovieList({Key? key, required this.movies}) : super(key: key);
  final List<Result> movies;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: movies.length,
      separatorBuilder: (_, index) => const SizedBox(width: 10),
      itemBuilder: (_, index) {
        final movie = movies[index];
        final month = movie.releaseDate.isEmpty
            ? 'No Date'
            : DateFormat('dd MMMM yyyy')
                .format(DateTime.parse(movie.releaseDate));
        return GestureDetector(
          onTap: () {
            log(movie.id.toString());
            AutoRouter.of(context)
                .push(MovieDetailsPageRoute(movieId: movie.id));
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
                            child: movie.posterPath == null
                                ? Container(
                                    width: 150,
                                    height: 200,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
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
                                      if (loadingProgress == null) return child;
                                      return Container(
                                        width: 150,
                                        height: 200,
                                        color: AppColors.grey.withOpacity(0.5),
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
                          voteAverage: movie.voteAverage,
                        ),
                        // child: Container(
                        //   padding: const EdgeInsets.all(2),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.primary,
                        //     borderRadius: BorderRadius.circular(188),
                        //   ),
                        //   child: Stack(
                        //     alignment: Alignment.center,
                        //     children: [
                        //       CircularProgressIndicator(
                        //         strokeWidth: 2,
                        //         backgroundColor: AppColors.grey,
                        //         value: movie.voteAverage * 0.1,
                        //         color: _identifyColor(movie.voteAverage),
                        //       ),
                        //       DefaultText(
                        //         '${(movie.voteAverage * 100).toString().substring(0, 2)}%',
                        //         color: AppColors.white,
                        //         size: 10,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ],
                  ),
                  DefaultText(
                    movie.title,
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
