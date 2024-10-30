import 'package:flutter/material.dart';


class DropdownButtonFormFieldColor extends StatefulWidget {
  const DropdownButtonFormFieldColor({super.key});
  @override
  State<DropdownButtonFormFieldColor> createState() => _DropdownButtonFormFieldColorState();
}



class _DropdownButtonFormFieldColorState extends State<DropdownButtonFormFieldColor> {
  String selectedValue = "dirty_beige";

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child:Container(width: 70, height: 30, color: Color(0xFF6E695C),))],),value: "dirty_beige"),
      DropdownMenuItem(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child:Container(width: 70, height: 30, color: Color(0xFFA99D81),))],),value: "light_beige"),
      DropdownMenuItem(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child:Container(width: 70, height: 30, color: Color(0xFF332107),))],),value: "chocolate"),
      DropdownMenuItem(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child:Container(width: 70, height: 30, color: Color(0xFF211904),))],),value: "brown"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return  DropdownButtonFormField(
        icon: Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFFEBEBEB),),
        isExpanded: true,
        style: TextStyle(
            color: Color(0xFFEBEBEB),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter'
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          filled: false,
        ),
        dropdownColor: Color(0xFFC2BDBD),

        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems);
  }
}