import '../../../components/constants.dart';

import '../Components/text_field_container.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const SearchButton({
    Key key,
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
