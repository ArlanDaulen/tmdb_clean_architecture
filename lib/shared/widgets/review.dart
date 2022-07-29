import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class ReviewWidget extends StatefulWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  State<ReviewWidget> createState() => _ReviewState();
}

class _ReviewState extends State<ReviewWidget> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 4,
            color: AppColors.black.withOpacity(0.3),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(188),
              color: AppColors.grey,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const DefaultText(
                      'A review by CinemaSerf',
                      fontWeight: FontWeight.w700,
                      size: 16,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            color: AppColors.white,
                            size: 15,
                          ),
                          SizedBox(width: 5),
                          DefaultText(
                            '6.0',
                            fontWeight: FontWeight.w300,
                            size: 12,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const DefaultText(
                  'Written by CinemaSerf on July 4, 2022',
                  color: AppColors.grey,
                  size: 12,
                  fontWeight: FontWeight.w300,
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    DefaultText(
                      """Eleven year old 'Gru' is asked by his school teacher what he wants to be when he grows up. "A super villain" he retorts - to the derision of his classmates. Little do they know, though, that he has applied to join the "Vicious Six" who have, themselves, just dumped their founder member "Wild Knuckles". They aren't so impressed when he turns up at the interview but he uses his newly designed glue-gun to escape with their all powerful, emerald encrusted, stone. Now the five are on the warpath as he entrusts the stone to his minion friend "Otto", but he manages to swap it for a pebble with eyes so now embarks on a mammoth cycle ride to fetch it back whilst the pursuing villains cause havoc. Luckily, "Wild Knuckles" hasn't given up. He kidnaps "Gru" to get the stone back, but when he realises that he no longer has it, the two form an unlikely, and quite amusing, partnership to retrieve it. I guess I'm just the wrong demographic for this, because although it hits the ground running and never stops for breath, I just didn't really get it. The yellow ovoid creatures are fun, but hardy the stuff of big screen entertainment and the plot reminded me of the recently released "Bad Guys" animation that I didn't much like either. It's my first foray into "Despicable" territory, but the slapstick approach to the whole thing will probably ensure it's my last. Others will love it, I'm sure - the cinema on a Sunday night was packed to the rafters, but this hadn't enough for the grown up in me to remain engaged for long.""",
                      maxLines: isHidden ? 4 : null,
                      overflow: isHidden ? TextOverflow.ellipsis : null,
                    ),
                    GestureDetector(
                      onTap: () => setState(() => isHidden = !isHidden),
                      child: DefaultText(
                        isHidden ? 'read more' : 'read less',
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
