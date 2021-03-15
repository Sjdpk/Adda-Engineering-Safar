import 'package:flutter/material.dart';
import 'constants.dart';
import 'text_field_container.dart';

class SearchButton extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  const SearchButton({
    Key? key,
    this.hintText,
    this.icon = Icons.search,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Constant.kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Constant.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
