import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final Widget title;
  final dynamic hight, width;
  Function? onpress;
  IconData? icon;
  Color? color;
  BlackButton(
      {Key? key,
      required this.title,
      this.onpress,
      required this.hight,
      required this.width,
      this.icon,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextButton(
        onPressed: onpress != null ? () => onpress!() : null,
        child: Container(
          decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(20.00),
              color: Colors.black),
          height: hight,
          width: width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                title,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
