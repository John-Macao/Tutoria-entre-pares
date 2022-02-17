
import 'package:flutter/material.dart';

// Color primario
const int pA = 255;
const int pR = 0;
const int pG = 55;
const int pB = 114;

// Color botones admin
const int bA = 255;
const int bR = 0;
const int bG = 142;
const int bB = 211;

get colorPrimario => argbColor(pA, pR, pG, pB);

get colorBotones => argbColorBotones(bA, bR, bG, bB);




Color argbColorBotones(int bA, int bR, int bG, int bB) {
  return Color.fromARGB(bA, bR, bG, bB);
}

Color argbColor(int a, int r, int g, int b ){
  return Color.fromARGB(a, r, g, b);
}


/*
get colorPrimary => hexToColor(cPrimary);

get colorSecondary => hexToColor(cSecondary);

get colorTextInputLabel => hexToColor(cSecondary);

get colorLineBorder => hexToColor(cSecondary);

get colorLinearProgress => hexToColor(cSecondary);
*/
