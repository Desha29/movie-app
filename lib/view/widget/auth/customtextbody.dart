import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String textitle;
  final String textbody;
  const CustomTextBodyAuth({
    super.key,
    required this.textitle,
    required this.textbody,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          textitle,
          style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(229, 9, 20, 1)),
        ),
        Text(
          textbody,
          textAlign: TextAlign.center,
          style:  TextStyle(color:Theme.of(context).textTheme.bodyMedium!.color, fontSize: 15),
        ),
      ]),
    );
  }
}
