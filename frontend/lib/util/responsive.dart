
import 'package:flutter/cupertino.dart';
import 'package:frontend/util/size_info.dart';

import 'edge_insets.dart';

class ResponsiveApp {
  late BuildContext _context;
  late MediaQueryData _mediaQueryData;
  late double _textScaleFactor;
  late double _scaleFactor;
  late EdgeInsetsApp edgeInsetsApp;

  
  ResponsiveApp(this._context){
    _mediaQueryData = MediaQuery.of(_context);
    _textScaleFactor = _mediaQueryData.textScaleFactor;
    _scaleFactor = isMobile(_context)?1:isTablet(_context)?1.1:1.3;
    edgeInsetsApp=EdgeInsetsApp(this);

  }


  //SizeBox Contenedores
  get sizeBox1W => setWidth(300);
  get sizeBox1H => setHeight(80);
  
  get sizeBox2W => setWidth(700);
  get sizeBox2H => setHeight(60);
  
  get sizeBox3W => setWidth(250);
  get sizeBox3H => setHeight(80);

  get sizeBox4W => setWidth(300); 
  get sizeBox4H => setHeight(100);
  

  //Text Size
  get text =>setSp(15);
  get textField => setSp(14);

  //Button Size
  get buttonSize => setSp(15);
  

  //SizeBox
  get boxWidth => setWidth(150);
  get boxHeight => setHeight(20);

  get boxLabelW => setWidth(190);
  get boxLabelH => setHeight(20);


  /*################################*/
  //Padding

  //Padding Horizontal
  get padding1Hrz => EdgeInsets.only(left: setWidth(5));
  get padding2Hrz => EdgeInsets.only(left: setWidth(25));
  get padding3Hrz => EdgeInsets.only(left: setWidth(10));



  /*################################*/
  //Border

  //BorderRadioCircular
  get border1C => BorderRadius.circular(10);

  
  


  // OPERADORES (estaticos)
  setWidth(int width) => width * _scaleWidth;

  setHeight(int height) => height * _scaleHeight;

  setSp(int fontSize) =>
      setWidth(fontSize) * _textScaleFactor;

  get _scaleWidth => (width * _scaleFactor) / width;

  get _scaleHeight => (height * _scaleFactor) /height;

  get width =>_mediaQueryData.size.width;
  get height =>_mediaQueryData.size.height;
}

