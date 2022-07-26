import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/shared/constants/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text_field.dart';

class SearchMovie extends StatelessWidget {
  const SearchMovie({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Expanded(
            child: DefaultTextField(
              controller: controller,
              hintText: 'Find a movie, series, person...',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Color.fromRGBO(41, 205, 156, 1),
                  Color.fromRGBO(21, 166, 218, 1),
                ],
              ),
            ),
            child: const DefaultText(
              'Search',
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
