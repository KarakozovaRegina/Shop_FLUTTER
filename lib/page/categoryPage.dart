import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_flutter/class/product.dart';
import 'package:shop_flutter/component/favoriteButton.dart';
import 'package:shop_flutter/page/productPage.dart';


class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {


  //category
  int _selectedCategoryIndex = 0;
  final List<String> _categories = ['All', 'Popular','Mens','Womens'];
  List<Widget> _buildCategoryChips() {

    return List<Widget>.generate(
      _categories.length,
          (index) => ChoiceChip(
            backgroundColor: Color(0xFF020202),
            label: Text(_categories[index],
            style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: _selectedCategoryIndex == index ? Color(0xFFBDA48E) : Color(0xFFEBEBEB),
            decoration: TextDecoration.none,
            fontFamily: 'Inter',
        )),
            checkmarkColor:Color(0xFFBDA48E),
            selected: _selectedCategoryIndex == index,
            onSelected: (selected) {
            setState(() {
            _selectedCategoryIndex = selected ? index : 0;
            filterProductsByCategory(_categories[index]);
            },);
        },
      ),
    ).toList();

  }


  // product
  List<Product> productList=[
    Product('Rory Cable Knit Sweater','Introducing our vintage cable knit sweater - a cosy piece with a rich history. Crafted from premium quality soft fabrics, this sweater features a classic cable knit pattern that dates back to the 17th century. ','\$170','assets/p1.png','Popular Mens'),
    Product('Brown Embroidered Maxi Dress','Maximise comfort during your day-to-day with thin spaghetti straps and a soft flowy fabric that sends you running carefree through nature. The most careful embroidery detailing will turn heads all season round.','\$180','assets/p2.png','Womens'),
    Product('Cohen Unisex Cable Knit Jacket','The Cohen Cardigan provides a laid back look with a snug feel. Crafted from the softness linen and cotton with a cable knit finish, it has a draped fit designed to be worn open over your favourite outfit or buttoned up for extra warmth.','\$180','assets/p3.png','Womens'),
    Product('Striped Textured Pants Jeans','Drawing inspiration from the "no worries" lifestyle, no pants do it better than the long awaited Ottway linen pants. Made from a textured linen fabric that is baggy, but never saggy.','\$150','assets/p4.png','Popular Womens'),
    Product('Off-White Overalls T-Shirt','The common overalls have transcended history from its utilitarian workwear beginnings. True vintage in design, made from 100% natural and less processed cotton.','\$90.00','assets/p5.png','Mens'),
    Product('Jagger - Washed Denim Pants Jeans','For those who live life laidback! Crafted from lightweight washed denim cotton, these pants give a comfortable, baggy fit with just the right amount of stretch.','\$210','assets/p6.png','Popular Mens'),
    Product('The Plan is No Plans T-Shirt','With a unique graphic design, it captures the sense of adventure and freedom that comes with getting lost in the wild. The comfortable fabric and rugged vintage look make it perfect for all-day wear.','\$80','assets/p7.png','Mens'),
    Product('Call of the Wild T-Shirt','Stay spontaneous in The Plan is No Plans tee, inspired by the laidback spirit of Ottway! Made from 100% soft cotton this t-shirt has unique-to-Ottway.','\$70','assets/p8.png','Womens')
  ];


  //filter
  List<Product> filteredProducts = [];
  String filterPrice = '';
  @override
  void initState() {
    filteredProducts = productList;
    super.initState();
  }

  void filterProductsByCategory(String category) {
    setState(() {
      filterPrice = category;
      if(category=='All'){
        filteredProducts=productList;
      } else{
        filteredProducts = productList.where((product) {
          return product.category.contains(category);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading:IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFFEBEBEB),
            ),
            onPressed: () {
                Navigator.pop(context);
            },
          ),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsetsDirectional.only(end: 16.0),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 30, // Установите радиус для изменения размера круга
              child: ClipOval(

                child: Image(
                  image: AssetImage('assets/avatar.jpg'),
                  fit: BoxFit.cover, // Чтобы изображение заполнило круг
                  width: 40, // Ширина, соответствующая радиусу
                  height: 40, // Высота, соответствующая радиусу
                ),
              ),
            ),
            ),
          ],
          backgroundColor:  Color(0xFF020202),
        ),
        body: SingleChildScrollView(
        child:  Column(
        children: [
        Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _buildCategoryChips(),
                )
              ]
          ),
        ),

        Container(
          width: double.infinity,
          height: 40,
          margin: EdgeInsets.only(left:22, right: 22,top: 20),
          child: Text(
            _categories[_selectedCategoryIndex],
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFFEBEBEB),
                decoration: TextDecoration.none,
                fontFamily: 'Inter'
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left:22, right: 22, top:34),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:  Column(
                children: [
                  for (int i = 0; i < filteredProducts.length-1; i += 2)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: buildCard(context, filteredProducts[i])),
                        if (i + 1 < filteredProducts.length)
                          Expanded(child: buildCard(context, filteredProducts[i + 1])),
                      ],
                    ),
                  if (filteredProducts.length % 2 != 0)
                    Row(
                      children: [
                        Container(width: MediaQuery.of(context).size.width*0.43,
                        child: Expanded(child: buildCard(context, filteredProducts.last))),
                      ],
                    ),
                ],
              )



            /*  Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: buildCard(context,productList[0]),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: buildCard(context,productList[1]),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: buildCard(context,productList[2]),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                          child:  buildCard(context,productList[3])
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: buildCard(context,productList[4]),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: buildCard(context,productList[5]),
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: buildCard(context,productList[6]),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: buildCard(context,productList[7]),
                      ),

                    ],
                  ),
                ],
              )*/





          ),
        ),
      ],
    )),



        backgroundColor: Color(0xFF020202),
      ),
    );
  }
}

GestureDetector buildCard(BuildContext context,Product product) {

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Productpage(product: product)),
      );
    },
    child: Card(
      elevation: 0.0,
      color: Color(0xFF020202),
      child: Container(
        color: Color(0xFF020202),
        width: 150,
        height: 278,
        child: Column(
          children: [
            Container(
                height: 185,
                child:Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0), // Установите радиус скругления
                      child: Image(
                        image: AssetImage(product.imgLink),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      bottom: 10.0, // Расстояние от нижней границы контейнера
                      right: 10.0,
                        child: FavoriteButton(),
                    ),
                  ],
                )
            ),
            Container(
              child:  ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(product.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFEBEBEB),
                        decoration: TextDecoration.none,
                        fontFamily: 'Inter'
                    ),
                    textAlign: TextAlign.center,),
                  subtitle: Text(product.price,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFEBEBEB),
                        decoration: TextDecoration.none,
                        fontFamily: 'Inter'
                    ),
                    textAlign: TextAlign.center,)
              ),
            )

          ],
        ),
      ),
    ),
  );




}


