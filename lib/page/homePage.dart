import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/page/categoryPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Container(
      height: MediaQuery.of(context).size.height*1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.4), // Полупрозрачный синий
                Color(0xFF020202).withOpacity(0.4)], // Цвета градиента
              begin: Alignment.topLeft, // Начальная точка градиента
              end: Alignment.bottomRight, // Конечная точка градиента
            ),
          ),

        child: Container(
          margin: const EdgeInsets.only(top: 500.0, left: 27.0, right: 27.0),
          child: Column(
            children: [
              Container(
                child: Text('Worldwide Shipping',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 38,
                    color: Color(0xFFEBEBEB),
                    decoration: TextDecoration.none,
                    fontFamily: 'Inter',
                  ),
                ),
                margin: EdgeInsets.only(bottom: 19),
              ),
              Container(
                child: Text('With delivery in over 75 countries, we are here to assist you with fast and easy shipments',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFEBEBEB),
                      decoration: TextDecoration.none,
                      fontFamily: 'Inter'
                  ),
                ),
                margin: EdgeInsets.only(bottom: 27),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:  Container(
                  child:  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Categorypage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xFFBDA48E),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF020202),
                              shape: BoxShape.circle, // Устанавливаем форму круга
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                            ),
                            height: 52,
                            width: 52,
                            margin: EdgeInsets.only(right: 10,left: 5),
                          ),
                          Text('Start Shopping',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFEBEBEB),
                              // fontFamily: 'Inter'
                            ),)
                        ],
                      ),
                      width: 209,
                      height: 66,
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Color(0xFFEBEBEB),
                      backgroundColor: Colors.transparent, // Устанавливаем фон кнопки прозрачным
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              )

            ],
          ),
        )
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/home.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
