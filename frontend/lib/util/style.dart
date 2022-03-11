
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

// COLOR AZUL OSCURO PRINCIPAL
get colorAzul => ColorA(255, 0, 55, 114);
get colorRojo => ColorR(255, 199, 13, 0);

get colorAzulClaro => ColorAC(255,0,142,211);

Color ColorA(int a, int r, int g, int b ){
  return Color.fromARGB(a, r, g, b);
}

Color ColorR(int a, int r, int g, int b){
  return Color.fromARGB(a, r, g, b);
}

Color ColorAC(int a, int r, int g, int b){
  return Color.fromARGB(a, r, g, b);
}





/*
get colorPrimary => hexToColor(cPrimary);

get colorSecondary => hexToColor(cSecondary);

get colorTextInputLabel => hexToColor(cSecondary);

get colorLineBorder => hexToColor(cSecondary);

get colorLinearProgress => hexToColor(cSecondary);
*/
