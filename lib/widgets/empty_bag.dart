import 'package:flutter/material.dart';

import 'subtitle_text.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath, title, subtitle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
          ),
          const SizedBox(
            height: 20,
          ),
          SubtitleTextWidget(
            label: title,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.red,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SubtitleTextWidget(
              label: subtitle,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
