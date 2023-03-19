import 'package:flutter/material.dart';

class SqaureTitle extends StatelessWidget {
  final String imagepath;
  const SqaureTitle({
    super.key,
    required this.imagepath,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200]
        ),
      child: Image.asset(imagepath,
      height: 60,),
    );
  }
}