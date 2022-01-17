import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/common/app_colors.dart';

class AppBarTextWidget extends StatelessWidget{
  final String text;

  const AppBarTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.orange,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}