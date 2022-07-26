import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/features/movies/domain/entities/movie_details.dart';
import 'package:tmdb_clean_architecture/shared/constants/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class VoteAverage extends StatelessWidget {
  const VoteAverage(
      {Key? key, required this.voteAverage, this.isDetailed = false})
      : super(key: key);
  final num voteAverage;
  final bool isDetailed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(188),
        color: const Color.fromRGBO(10, 21, 26, 1),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          isDetailed
              ? SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    value: voteAverage * 0.1,
                    backgroundColor:
                        _identifyColor(voteAverage).withOpacity(0.5),
                    color: _identifyColor(voteAverage),
                  ),
                )
              : CircularProgressIndicator(
                  strokeWidth: 2,
                  value: voteAverage * 0.1,
                  backgroundColor: _identifyColor(voteAverage).withOpacity(0.5),
                  color: _identifyColor(voteAverage),
                ),
          DefaultText(
            voteAverage == 0.0
                ? 'NR'
                : '${(voteAverage * 100).toString().substring(0, 2)}%',
            color: AppColors.white,
            fontWeight: isDetailed ? FontWeight.w600 : FontWeight.w500,
            size: isDetailed ? 16 : 10,
          ),
        ],
      ),
    );
  }

  Color _identifyColor(num voteAverage) {
    if (voteAverage >= 7.5) {
      return Colors.green;
    } else if (voteAverage < 7.5 && voteAverage >= 5) {
      return Colors.yellow;
    } else if (voteAverage == 0.0) {
      return AppColors.primary;
    } else {
      return Colors.red;
    }
  }
}
