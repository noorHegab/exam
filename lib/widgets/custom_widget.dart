import 'package:flutter/material.dart';

Widget buildPerson({
  required String? hexColor1,
  required String? hexColor2,
  required String? image,
  required String? text,
  required double? height,
  required double? width,
}) =>
    Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: 280,
          height: 430,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              topRight: Radius.circular(103),
              bottomLeft: Radius.circular(59),
              bottomRight: Radius.circular(22),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(int.parse(hexColor1!, radix: 16) + 0xFF000000),
                Color(int.parse(hexColor2!, radix: 16) + 0xFF000000),
              ],
            ),
          ),
        ),
        Positioned(
          top: -80.0,
          child: Container(
            width: 278.0,
            height: 482.0,
            child: Image(
              image: AssetImage(image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
            height: height,
            width: width,
            child: Text(
              text!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.w400,
              ),
            )),
      ],
    );
