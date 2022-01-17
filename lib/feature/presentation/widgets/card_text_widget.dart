import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';

class CardTextWidget extends StatelessWidget{
  final String text;

  const CardTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.orange,
      ),
    );
  }
}