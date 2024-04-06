import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../components/constant/dark_theme.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 100) {
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text.rich(
        TextSpan(
          style: darkTheme.textTheme.bodyMedium,
          children: [
            TextSpan(text: isExpanded ? widget.text : firstHalf),
            if (!isExpanded) ...[
              TextSpan(text: '...'),
              TextSpan(
                text: 'show more',
                style: darkTheme.textTheme.bodyLarge,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = true;
                    });
                  },
              ),
            ],
            if (isExpanded && secondHalf.isNotEmpty) ...[
              TextSpan(text: secondHalf),
              TextSpan(
                text: 'show less',
                style: darkTheme.textTheme.bodyLarge,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    setState(() {
                      isExpanded = false;
                    });
                  },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
