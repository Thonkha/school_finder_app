// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({
    Key? key,
    this.isResponsive = false,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 50, 50, 143)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset("images/arrow.png")],
        ));
  }
}
