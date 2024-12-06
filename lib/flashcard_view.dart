import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {
  final String text;

  FlashcardView({Key? Key, required this.text}): super(key: Key);


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Center(
        child: Text(text, textAlign: TextAlign.center,),
      ),
    );
  }
}
