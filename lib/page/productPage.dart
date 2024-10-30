import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_flutter/class/product.dart';
import 'package:shop_flutter/component/dropdownButtonCOLOR.dart';
import 'package:shop_flutter/component/dropdownlistSize.dart';


class Productpage extends StatefulWidget {
  const Productpage({super.key,required this.product});
  final Product product;

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  Color _buttonColor = Color(0xFFEBEBEB);
  double _buttonSize = 18;

  void _showOrderConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Подтверждение заказа',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color(0xFFBDA48E),
                decoration: TextDecoration.none,
                fontFamily: 'Inter',
              )),
          content: Text('Ваш заказ успешно оформлен!',
              style: TextStyle(
                fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF020202),
            decoration: TextDecoration.none,
            fontFamily: 'Inter',
          )),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Закрытие диалога
              },
              child: Text('ОК',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFBDA48E),
                    decoration: TextDecoration.none,
                    fontFamily: 'Inter',
                  )),
            ),
          ],
        );
      },
    );
  }
  void _onPressed() {
      setState(() {
        _buttonColor = _buttonColor == Color(0xFFEBEBEB) ? Color(0xFF844829) : Color(0xFFEBEBEB);
        _buttonSize = _buttonSize == 18 ? 25 : 18;
      });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
        child: Scaffold(
        appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFFEBEBEB),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Details',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xFFEBEBEB),
              decoration: TextDecoration.none,
              fontFamily: 'Inter'
          )
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: _buttonColor,
              size: _buttonSize ,
            ),
            onPressed: _onPressed,

          ),
        ],
        backgroundColor:  Color(0xFF020202),
        ),
        body:SingleChildScrollView(
          child:  Column(
            children: [ Container(
              color: Color(0xFF020202),
              child: Container(
                color: Color(0xFF020202),
                width: MediaQuery.of(context).size.width*1,
                margin: EdgeInsets.only(right: 10,left: 10),
                child: Column(
                  children: [
                    Container(
                        margin: EdgeInsets.only(top: 10,),
                        width: 346,
                        height: 375,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image(
                            image: AssetImage(widget.product.imgLink),
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),)

                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30,),
                      width: 346,

                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text(widget.product.title,
                                    style: TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFEBEBEB),
                                        decoration: TextDecoration.none,
                                        fontFamily: 'Inter'
                                    ),
                                  ),
                                  width: MediaQuery.of(context).size.width*0.65,
                                ),
                                Container(
                                  width: 67,
                                  height: 37,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xFFBDA48E).withOpacity(0.4),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color(0xFFBDA48E),),
                                      Text('5.0',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFFEBEBEB),
                                            decoration: TextDecoration.none,
                                            fontFamily: 'Inter'
                                        ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 15),
                            width: MediaQuery.of(context).size.width*1,
                            child:  Text(widget.product.description,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFEBEBEB),
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Inter'
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 10),
                            height: 55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 110,
                                  height: MediaQuery.of(context).size.height*1,
                                  child: DropdownlistSize(),
                                ),
                                Container(
                                  width: 120,
                                  height: MediaQuery.of(context).size.height*1,
                                  child: DropdownButtonFormFieldColor(),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 15),
                            width: MediaQuery.of(context).size.width*1,
                            child:  Text(widget.product.price,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFEBEBEB),
                                  decoration: TextDecoration.none,
                                  fontFamily: 'Inter'
                              ),
                            ),


                          ),
                          SizedBox(height: 30),
                          Container(
                            child:  ElevatedButton(
                              onPressed: () {
                                _showOrderConfirmation(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFBDA48E),
                                ),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child:  Icon(
                                        Icons.shopping_bag_outlined,
                                        size: 30,
                                      ),
                                    ),
                                    Text('Start Shopping',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFFEBEBEB),
                                          fontFamily: 'Inter'
                                      ),)
                                  ],
                                ),
                                height: 66,
                              ),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Color(0xFFEBEBEB),
                                backgroundColor: Colors.transparent, // Устанавливаем фон кнопки прозрачным
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )],
          )


        )


        )
        );
  }
}
