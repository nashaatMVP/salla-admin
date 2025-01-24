import 'package:flutter/material.dart';
import 'package:shopsmart_admin_en/widgets/subtitle_text.dart';

class DashBoardCard extends StatelessWidget {
  const DashBoardCard(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.onTap});

  final String imagePath, text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        elevation: 30,
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                imagePath,
                height: 30,
                width: 30,
              ),
              const SizedBox(
                height: 8,
              ),
              SubtitleTextWidget(
                label: text,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
