import 'package:flutter/material.dart';

class HexaColor extends Color {

static int _heaxaconverter(String clr){

   clr= clr.toUpperCase().replaceAll("#", "");
if (clr.length==6){
  clr="FF"+clr;
}
return int.parse(clr,radix: 16) ;
}
HexaColor(String clr): super(_heaxaconverter(clr));
}