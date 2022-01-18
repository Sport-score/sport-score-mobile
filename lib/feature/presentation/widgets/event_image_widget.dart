import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sport_shedule_mobile/feature/presentation/widgets/error_text_widget.dart';

class EventImageWiget extends StatelessWidget{
  List<String> images;

  EventImageWiget({required this.images});

  @override
  Widget build(BuildContext context) {
    if(images.isNotEmpty){
      Uint8List imageBytes = base64.decode(images[0]);
      return Image.memory(imageBytes);
    }
    else{
      return ErrorTextWidget(text: 'No image');
    }
  }
}