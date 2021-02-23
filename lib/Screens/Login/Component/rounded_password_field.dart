import 'package:adda/components/constants.dart';
import 'package:adda/components/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Constant.kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: Constant.kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Constant.kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
