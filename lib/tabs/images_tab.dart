// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ImagesTab extends StatelessWidget {
  const ImagesTab({Key? key}) : super(key: key);

  Widget _buildPhotoWidget(String imgName) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Image(
        image: AssetImage("assets/$imgName"),
        width: 100,
        height: 100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                // ignore: prefer_const_literals_to_create_immutables
                colors: [
              Colors.black54,
              Colors.black45,
              Colors.black12,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPhotoWidget("lata1.jpg"),
                _buildPhotoWidget("lata2.jpg"),
                _buildPhotoWidget("lata3.jpg"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPhotoWidget("quito1.jpg"),
                _buildPhotoWidget("quito2.jpg"),
                _buildPhotoWidget("quito3.jpg"),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPhotoWidget("caracas1.jpg"),
                _buildPhotoWidget("caracas2.jpg"),
                _buildPhotoWidget("caracas3.jpg"),
              ],
            ),
          ],
        ));
  }
}
