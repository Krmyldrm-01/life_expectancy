import 'package:flutter/material.dart';

import 'Constans.dart';

class MaleOrFemale extends StatelessWidget {
  final IconData iconData;
  final String gender;
  final Color color;

  MaleOrFemale(this.iconData, this.gender, this.color);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          size: 60,
          iconData,
          color: color,
        ),
        Text(
          gender,
          style: kAppTextStyle,
        ),
      ],
    );
  }
}

class MyContainerWidget extends StatelessWidget {
  final Color MyWColor; //oluşturaln widge içeriisne renk özelliği kattık
  //bunu constructer içerisine ekledilk

  //MyContainerWidget({@required this.renk = Colors.white70});
  final Widget? child; // child özelliği nullable yapıldı
  final VoidCallback? onPress; // ;

  MyContainerWidget({
    this.MyWColor = Colors.white70,
    this.child,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: child,
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: MyWColor,
        ),
      ),
      onTap: onPress,
    );
  }
}
