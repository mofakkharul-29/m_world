import 'package:firebase_auth_practice/common/custom_elevated_button.dart';
import 'package:firebase_auth_practice/const/colors/color_pallete.dart';
import 'package:flutter/material.dart';

class PageBuilderItem extends StatelessWidget {
  final Map<String, dynamic> currentPage;
  final int idx;
  final VoidCallback onFinish;
  const PageBuilderItem({
    super.key,
    required this.currentPage,
    required this.idx,
    required this.onFinish,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        getItem(
          Image.asset(currentPage['images']),
          50.0,
          10,
          10,
        ),
        getItem(
          Container(
            padding: EdgeInsets.all(10.0),
            height: 220,
            decoration: BoxDecoration(
              color: insideContainer,
            ),
            child: Text(
              textAlign: TextAlign.justify,
              currentPage['des'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          0.0,
          0.0,
          0.0,
          10,
          10,
        ),
        const SizedBox(height: 20),
        idx == 2
            ? CustomElevatedButton(
                onPressed: onFinish,
                text: 'Get Started',
              )
            : SizedBox(),
      ],
    );
  }

  Widget getItem(
    Widget? child, [
    double paddingTop = 0.0,
    double topLeft = 0.0,
    double topRight = 0.0,
    double bottomLeft = 0.0,
    double bottomRight = 0.0,
  ]) {
    return Padding(
      padding: EdgeInsets.only(
        top: paddingTop,
        left: 15,
        right: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
        child: child,
      ),
    );
  }
}
