import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mobeebanq/constants.dart';

import 'myCircleMenu.dart';

class ArcItem {
  IconData icons;
  List<Color> colors;
  double startAngle;

  ArcItem(this.icons, this.colors, this.startAngle);
}



class ChooserPainter extends CustomPainter {
  //debugging Paint
  final debugPaint = new Paint()
    ..color = Colors.red.withAlpha(100) //0xFFF9D976
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke;

  // final linePaint = new Paint()
  //   ..color = Colors.black.withAlpha(65) //0xFFF9D976
  //   ..strokeWidth = 0.0
  //   ..style = PaintingStyle.stroke
  //   ..strokeCap = StrokeCap.square;

  final whitePaint = new Paint()
    ..color = basicColor //0xFFF9D976
    ..strokeWidth = 0.0
    ..style = PaintingStyle.fill;

  List<ArcItem> arcItems;
  double angleInRadians;
  double angleInRadiansByTwo;
  double angleInRadians1;
  double angleInRadians2;
  double angleInRadians3;
  double angleInRadians4;
  ChooserPainter(List<ArcItem> arcItems, double angleInRadians) {
    this.arcItems = arcItems;
    this.angleInRadians = angleInRadians;
    this.angleInRadiansByTwo = angleInRadians/2;

    angleInRadians1 = angleInRadians/6;
    angleInRadians2 = angleInRadians/3;
    angleInRadians3 = angleInRadians*4/6;
    angleInRadians4 = angleInRadians*5/6;

  }

  @override
  void paint(Canvas canvas, Size size) {
    //common calc
    double centerX = size.width / 2.6;
    double centerY = size.height * 1.8;
    Offset center = Offset(centerX, centerY);
    double radius = sqrt((size.width * size.width) / 2);

//    var mainRect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
//    canvas.drawRect(mainRect, debugPaint);

    //for white arc at bottom
    // double leftX = centerX - radius;
    // double topY = centerY - radius;
    // double rightX = centerX + radius;
    // double bottomY = centerY + radius;

    //for items
    double radiusItems = radius * 1.5;
    double leftX2 = centerX - radius * 0.7;
    double topY2 = centerY - radiusItems;
    double rightX2 = centerX + radius * 0.7;
    double bottomY2 = centerY + radius * 0.0;

    //for shadow
    double radiusShadow = radius*1.13;
    double leftX3 = centerX - radiusShadow;
    double topY3 = centerY - radiusShadow;
    double rightX3 = centerX + radiusShadow;
    double bottomY3 = centerY + radiusShadow;

    double radiusText = radius * 1.10;
    double radius4 = radius * 1.12;
    double radius5 = radius * 1.06;
    var arcRect = Rect.fromLTRB(leftX2, topY2, rightX2, bottomY2);


    var dummyRect = Rect.fromLTRB(-7.0, 0.0, size.width, size.height);

    canvas.clipRect(dummyRect, clipOp: ClipOp.intersect);

    for (int i = 0; i < arcItems.length; i++) {
      canvas.drawArc(
          arcRect,
          arcItems[i].startAngle,
          angleInRadians,
          true,
          new Paint()
            ..style = PaintingStyle.fill
            ..shader = new LinearGradient(
              colors: arcItems[i].colors,
            ).createShader(dummyRect));

      // final icon = arcItems[i].icons;
      // TextPainter textPainter = TextPainter(textDirection: TextDirection.rtl);
      // textPainter.text = TextSpan(text: String.fromCharCode(icon.codePoint),
      //     style: TextStyle(fontSize: 40.0,));
      // textPainter.layout();
      // textPainter.paint(canvas, Offset(50.0,50.0));

      // Draw text
      IconData span = new IconData(icon: arcItems[i].icons);
      TextPainter tp = new TextPainter(text: span, textAlign: TextAlign.center, textDirection: TextDirection.ltr,);
      tp.layout();
      tp.paint(canvas, Offset(50,50));

//

      //find additional angle to make text in center
      double f = tp.width/2;
      double t = sqrt((radiusText*radiusText) + (f*f));

      double additionalAngle = acos(((t*t) + (radiusText*radiusText)-(f*f))/(2*t*radiusText));

      double tX = center.dx + radiusText*cos(arcItems[i].startAngle+angleInRadiansByTwo - additionalAngle);// - (tp.width/2);
      double tY = center.dy + radiusText*sin(arcItems[i].startAngle+angleInRadiansByTwo - additionalAngle);// - (tp.height/2);

      canvas.save();
      canvas.translate(tX,tY);
//      canvas.rotate(arcItems[i].startAngle + angleInRadiansByTwo);
      canvas.rotate(arcItems[i].startAngle+angleInRadians+angleInRadians+angleInRadiansByTwo);
      tp.paint(canvas, new Offset(0.0,-60.3));
      canvas.restore();

//
    }


    //shadow
    Path shadowPath = new Path();
    shadowPath.addArc(
        Rect.fromLTRB(leftX3, topY3, rightX3, bottomY3),
        ChooserState.degreeToRadians(180.0),
        ChooserState.degreeToRadians(180.0));
    canvas.drawShadow(shadowPath, Colors.black, 18.0, true);

    //bottom white arc
    // canvas.drawArc(
    //     Rect.fromLTRB(leftX, topY, rightX, bottomY),
    //     ChooserState.degreeToRadians(180.0),
    //     ChooserState.degreeToRadians(180.0),
    //     true,
    //     whitePaint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}