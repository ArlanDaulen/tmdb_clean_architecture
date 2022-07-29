import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class Filters extends StatelessWidget {
  const Filters({
    Key? key,
    required this.onSortTapped,
    required this.onFiltersTapped,
    required this.onWhereToWatchTapped,
  }) : super(key: key);
  final Function() onSortTapped;
  final Function() onFiltersTapped;
  final Function() onWhereToWatchTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(child: _buildFilter('Sort', () => onSortTapped)),
              const SizedBox(width: 10),
              Flexible(child: _buildFilter('Filters', () => onFiltersTapped)),
            ],
          ),
          const SizedBox(height: 10),
          _buildFilter('Where To Watch', () => onWhereToWatchTapped),
        ],
      ),
    );
  }

  _buildFilter(String name, Function() onTap) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                color: AppColors.black.withOpacity(0.3),
                blurRadius: 1,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefaultText(
              name,
              fontWeight: FontWeight.w600,
              size: 16,
            ),
            const Icon(
              CupertinoIcons.forward,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
