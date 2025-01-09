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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Card(
          shadowColor: const Color.fromARGB(255, 168, 134, 53),
          elevation: 70,
          color: Colors.grey[400],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  height: 70,
                  width: 70,
                ),
                const SizedBox(
                  height: 8,
                ),
                SubtitleTextWidget(
                  label: text,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
