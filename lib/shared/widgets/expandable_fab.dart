import 'package:flutter/material.dart';
import 'package:tmdb_clean_architecture/shared/utils.dart';
import 'package:tmdb_clean_architecture/shared/widgets/default_text.dart';

class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key? key,
    required this.icons,
    required this.texts,
    required this.onTaps,
  }) : super(key: key);
  final List<IconData> icons;
  final List<String> texts;
  final List<Function()> onTaps;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> {
  bool _isOpen = false;

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 180,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ...List.generate(
            widget.icons.length,
            (index) => AnimatedPositioned(
              bottom: _isOpen ? (index + 1) * 60 : 0,
              duration: const Duration(milliseconds: 250),
              child: _buildSelection(index),
            ),
          ),
          _tapToClose(),
        ],
      ),
    );
  }

  Row _buildSelection(int index) {
    return Row(
      children: [
        AnimatedOpacity(
            opacity: _isOpen ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: DefaultText(
              widget.texts[index],
              fontWeight: FontWeight.w600,
              color: AppColors.secondary,
            )),
        GestureDetector(
          onTap: () {
            widget.onTaps[index]();
            setState(() {
              _isOpen = false;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(188),
            ),
            child: Icon(
              widget.icons[index],
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _tapToClose() {
    return GestureDetector(
      onTap: () => _toggle(),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(188),
          color: AppColors.primary,
        ),
        child: Icon(
          _isOpen ? Icons.arrow_drop_down : Icons.auto_awesome_motion_outlined,
          color: AppColors.white,
        ),
      ),
    );
  }
}
