import 'package:flutter/material.dart';

class YMAProfilePicture extends StatelessWidget {
  const YMAProfilePicture({required this.photo});
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(photo),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
