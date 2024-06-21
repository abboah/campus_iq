import 'package:flutter/material.dart';

class BuildPageContent extends StatelessWidget {
  const BuildPageContent({
    super.key,
    required this.context,
    required this.imagePath,
    required this.text,
    required this.subText,
    required this.color,
  });

  final BuildContext context;
  final String imagePath;
  final String text;
  final String subText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
      decoration: BoxDecoration(color: color),
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          Text(
            text,
            style:
                textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          Image.asset(imagePath),
          Text(
            subText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
