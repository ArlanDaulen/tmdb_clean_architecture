import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_bloc.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_event.dart';
import 'package:tmdb_clean_architecture/features/series/presentation/bloc/series_details_bloc/series_details_state.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_title.dart';
import 'package:tmdb_clean_architecture/shared/widgets/loading_view.dart';
import 'package:tmdb_clean_architecture/shared/widgets/movie_or_tv_listview.dart';
import 'package:tmdb_clean_architecture/shared/widgets/review.dart';
import 'package:tmdb_clean_architecture/shared/widgets/vote_average.dart';

class SeriesDetialsPage extends StatelessWidget {
  const SeriesDetialsPage({Key? key, @PathParam() required this.seriesId})
      : super(key: key);
  final int seriesId;

  @override
  Widget build(BuildContext context) {
    context.read<SeriesDetailsBloc>().add(LoadSeriesDetails(tvId: seriesId));
    return BlocBuilder<SeriesDetailsBloc, SeriesDetailsState>(
        builder: (context, state) {
      if (state is SeriesDetailsLoaded) {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/original/${state.details.backdropPath}',
                    height: 250,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  FutureBuilder<Color>(
                      future: getImagePalette(NetworkImage(
                          'https://image.tmdb.org/t/p/original/${state.details.posterPath!}')),
                      builder: (_, s) {
                        return Container(
                          width: double.maxFinite,
                          height: 250,
                          color: s.hasData
                              ? s.data!.withOpacity(0.85)
                              : AppColors.grey.withOpacity(0.5),
                        );
                      }),
                  Row(
                    children: [
                      Image.network(
                        'https://image.tmdb.org/t/p/original/${state.details.posterPath!}',
                        width: 150,
                        height: 200,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultText(
                              state.details.name,
                              fontWeight: FontWeight.w700,
                              size: 16,
                              color: AppColors.white,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      right: 5, top: 5, bottom: 5),
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColors.white),
                                  ),
                                  child: const DefaultText(
                                    'TV-14',
                                    color: AppColors.white,
                                  ),
                                ),
                                _buildDot(false),
                                DefaultText(
                                  DateFormat('dd/MM/yyyy').format(
                                      DateTime.parse(
                                          state.details.firstAirDate)),
                                  color: AppColors.white,
                                ),
                                _buildDot(false),
                                DefaultText(
                                  '${state.details.episodeRunTime.isEmpty} min',
                                  color: AppColors.white,
                                ),
                              ],
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.details.genres.length,
                              separatorBuilder: (_, index) =>
                                  const SizedBox(height: 2),
                              itemBuilder: (_, index) {
                                final genre = state.details.genres[index];
                                return Row(
                                  children: [
                                    _buildDot(true),
                                    DefaultText(
                                      genre.name,
                                      color: AppColors.white,
                                    ),
                                  ],
                                );
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    VoteAverage(
                      voteAverage: state.details.voteAverage,
                      isDetailed: true,
                    ),
                    const SizedBox(width: 10),
                    const DefaultText(
                      'User\nscore',
                      fontWeight: FontWeight.w500,
                      size: 16,
                    ),
                    const Spacer(),
                    Flexible(
                      child: Column(
                        children: [
                          DefaultText(
                            state.details.tagline,
                            isCenter: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const DefaultTitle('Overview'),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DefaultText(state.details.overview),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultTitle(
                        'Original Name',
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: DefaultText(state.details.originalName),
                      ),
                      const SizedBox(height: 5),
                      const DefaultTitle(
                        'Status',
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: DefaultText(state.details.status),
                      ),
                      const SizedBox(height: 5),
                      const DefaultTitle(
                        'Original Language',
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: DefaultText(state.details.originalLanguage),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const DefaultTitle(
                          'Network',
                          size: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: DefaultText(state.details.networks.first.name),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.facebookSquare,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    FaIcon(
                      FontAwesomeIcons.twitter,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    FaIcon(
                      FontAwesomeIcons.instagram,
                      size: 35,
                    ),
                    SizedBox(width: 10),
                    FaIcon(
                      FontAwesomeIcons.link,
                      size: 35,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const DefaultTitle('Keywords'),
              const SizedBox(height: 5),
              state.keywords.fold(
                (l) => DefaultText(l.message ?? 'No Keywords'),
                (r) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(r.keywords.length, (index) {
                      final keyword = r.keywords[index];
                      return Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: DefaultText(keyword.name),
                      );
                    }),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const DefaultTitle('Top Billed Cast'),
              const SizedBox(height: 5),
              state.credits.fold(
                (l) => DefaultText(l.message ?? 'No credits'),
                (r) {
                  return SizedBox(
                    height: 280,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: r.cast.length,
                      separatorBuilder: (_, index) => const SizedBox(width: 10),
                      itemBuilder: (_, index) {
                        final caster = r.cast[index];
                        return Container(
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 4),
                                  color: AppColors.black.withOpacity(0.3),
                                  blurRadius: 1,
                                )
                              ],
                              color: AppColors.white),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15),
                                ),
                                child: caster.profilePath != null
                                    ? Image.network(
                                        'https://image.tmdb.org/t/p/original/${caster.profilePath}',
                                        width: double.maxFinite,
                                        alignment: Alignment.topCenter,
                                        height: 180,
                                        fit: BoxFit.cover,
                                      )
                                    : Container(
                                        width: double.maxFinite,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.grey.withOpacity(0.5),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                        ),
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: DefaultText(caster.name),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: DefaultText(
                                  caster.character,
                                  color: AppColors.grey,
                                  fontWeight: FontWeight.w200,
                                  size: 12,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const DefaultTitle('Reviews'),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () {},
                      child: const DefaultText(
                        'read all reviews',
                        color: AppColors.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              state.reviews.fold(
                (l) => DefaultText(l.message ?? 'No Reviews'),
                (r) => const ReviewWidget(),
              ),
              const DefaultTitle('Media'),
              state.images.fold(
                (l) => DefaultText(l.message ?? 'No images'),
                (r) => r.posters.isEmpty
                    ? Center(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.no_photography_rounded,
                              color: AppColors.grey,
                              size: 80,
                            ),
                            DefaultText('No Images (>_<)'),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 280,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16),
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: r.posters.length,
                          separatorBuilder: (_, index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (_, index) {
                            final poster = r.posters[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/original/${poster.filePath}',
                                width: double.maxFinite,
                                alignment: Alignment.topCenter,
                                cacheWidth: 300,
                                height: 180,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
              ),
              const SizedBox(height: 10),
              const DefaultTitle('Recommendations'),
              const SizedBox(height: 5),
              state.recommendations.fold(
                (l) => DefaultText(l.message ?? 'No Recommentations'),
                (r) => SizedBox(
                  height: 280,
                  child: MovieOrTvListView(
                    isMovie: false,
                    tvs: r.results,
                    isReplace: true,
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return const LoadingView();
      }
    });
  }

  Container _buildDot(bool isOnlyRightMargin) {
    return Container(
      width: 5,
      height: 5,
      margin: EdgeInsets.only(left: isOnlyRightMargin ? 0 : 5, right: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Future<Color> getImagePalette(ImageProvider imageProvider) async {
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.dominantColor!.color;
  }
}
