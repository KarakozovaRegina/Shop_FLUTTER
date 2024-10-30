import 'package:flutter/material.dart';


class DropdownlistSize extends StatefulWidget {
  const DropdownlistSize({super.key});
  @override
  State<DropdownlistSize> createState() => _DropdownlistSizeState();
}



class _DropdownlistSizeState extends State<DropdownlistSize> {
  String selectedValue = "SIZE";

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("SIZE"),value: "SIZE"),
      DropdownMenuItem(child: Text("S"),value: "S"),
      DropdownMenuItem(child: Text("M"),value: "M"),
      DropdownMenuItem(child: Text("L"),value: "L"),
    ];
    return menuItems;
  }


  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedValue,
        icon: Icon(Icons.keyboard_arrow_down_outlined, color: Color(0xFFEBEBEB),),
        style: TextStyle(
            color: Color(0xFFEBEBEB),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter'
        ),
        dropdownColor: Color(0xFFC2BDBD),
        underline: SizedBox.shrink(),
        isExpanded: true,
        onChanged: (String? newValue){
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: dropdownItems
    );
  }
}