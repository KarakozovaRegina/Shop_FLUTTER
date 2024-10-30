import 'package:flutter/material.dart';


class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  Color _buttonColor = Color(0xFFBDA48E);
  Color _buttonIconColor = Color(0xFFEBEBEB);

  void _onPressed() {
    setState(() {
      _buttonColor = _buttonColor == Color(0xFFBDA48E) ? Color(0xFFEBEBEB) : Color(0xFFBDA48E);
      _buttonIconColor = _buttonIconColor == Color(0xFFEBEBEB) ? Color(0xFFBDA48E) : Color(0xFFEBEBEB);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 41,
        width: 41,
        decoration: BoxDecoration(
          color: _buttonColor,
          shape: BoxShape.circle,
        ),
          child:IconButton(
          color: _buttonColor,
          icon: Icon(
            Icons.favorite_border,
            color: _buttonIconColor,
            size: 18,
          ),
            onPressed: _onPressed
        ),);
  }
}