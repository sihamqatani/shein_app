import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//import 'package:flutter_hex_color/flutter_hex_color.dart';

class MyAuthTextField extends StatelessWidget {
  late TextEditingController controller;
  TextInputType? type;
  void Function(String)? onSubmit;
  void Function()? onTap;
  String? Function(String?)? validate;
  String? Function(String?)? onChange;
  late String label;
  IconData? prefix;
  IconData? suffix;
  late bool obcure;
  int? maxline;
  void Function()? suffixPressed;
  FloatingLabelBehavior? floatingLabelBehavior;
  void Function()? onTapIcon;
  MyAuthTextField(
      {Key? key,
      required this.controller,
      this.type,
      required this.obcure,
      this.onSubmit,
      this.onTap,
      this.validate,
      required this.label,
      this.prefix,
      this.suffix,
      this.suffixPressed,
      this.maxline,
      this.onChange,
      this.floatingLabelBehavior,
      this.onTapIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: MediaQuery.of(context).size.height * .05,
        child: TextFormField(
      // textAlign: TextAlign.center,
      maxLines: maxline == null ? 1 : maxline,
      // keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      //scrollPadding: EdgeInsets.all(8),
      // Added this

      //  cursorHeight: MediaQuery.of(context).size.height * .08,
      obscureText: obcure,
      keyboardType: type,
      onChanged: onChange,
      validator: validate,
      controller: controller,
      onTap: onTapIcon,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: label,
          floatingLabelStyle:
              TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.symmetric(horizontal: 1),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.green, width: 1.5),
          //   borderRadius: BorderRadius.circular(14),
          // ),

          border: InputBorder.none,
          suffix: InkWell(
              onTap: suffixPressed,
              child: Icon(
                suffix,
                size: 20,
                color: Colors.black,
              )),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefix == null
              ? null
              : Icon(
                  prefix,
                  color: Colors.black,
                ),

          // focusColor: HexColor('#0063FF'),

          //  hintText: label,
          hintStyle: TextStyle(
              color: Colors.grey.withOpacity(.6), fontWeight: FontWeight.bold)),
    ));
  }
}
