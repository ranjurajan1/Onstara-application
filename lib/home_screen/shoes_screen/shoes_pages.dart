import 'package:flutter/material.dart';

import '../../bottombar_widgets/bottom_bar.dart';
import '../shirt_screen/shirt_detail_page.dart';

class ShoesPages extends StatefulWidget {
  const ShoesPages({Key? key}) : super(key: key);

  @override
  State<ShoesPages> createState() => _ShoesPagesState();
}

class _ShoesPagesState extends State<ShoesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 15.0,
          ),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: [
                _buildcard('Loafer', '\$100', 'assets/images/shoes1.jpeg', false, true, context),
                _buildcard('Brogues', '\$500', 'assets/images/shoes2.png', false, true, context),
                _buildcard('Boot', '\$600', 'assets/images/shoes3.jpeg', false, true, context),
                _buildcard('Clog', '\$399', 'assets/images/shoes7.jpeg', false, true, context),
                _buildcard('Kitten', '\$432', 'assets/images/shoes8.jpeg', false, true, context),
                _buildcard('Polo Shirt', '\$399', 'assets/images/shoes12.jpeg', false, true, context),
                _buildcard('Polo Shirt', '\$399', 'assets/images/shoes5.jpeg', false, true, context),
                _buildcard('Mule', '\$452', 'assets/images/shoes6.jpeg', false, true, context),
                _buildcard('Clog', '\$399', 'assets/images/shoes7.jpeg', false, true, context),
                _buildcard('Kitten', '\$432', 'assets/images/shoes8.jpeg', false, true, context),
                _buildcard('Kitten', '\$432', 'assets/images/shoes9.jpeg', false, true, context),
                _buildcard('Wedge', '\$366', 'assets/images/shoes10.jpeg', false, true, context),
                _buildcard('Chukka', '\$430', 'assets/images/shoes1.jpeg', false, true, context),
                _buildcard('Mule', '\$452', 'assets/images/shoes6.jpeg', false, true, context),
                _buildcard('Clog', '\$399', 'assets/images/shoes7.jpeg', false, true, context),
                _buildcard('Clog', '\$399', 'assets/images/shoes7.jpeg', false, true, context),
                _buildcard('Kitten', '\$432', 'assets/images/shoes8.jpeg', false, true, context),
                _buildcard('Kitten', '\$432', 'assets/images/shoes9.jpeg', false, true, context),
                _buildcard('Wedge', '\$366', 'assets/images/shoes10.jpeg', false, true, context),
                _buildcard('Chukka', '\$430', 'assets/images/shoes1.jpeg', false, true, context),
                _buildcard('Mule', '\$452', 'assets/images/shoes6.jpeg', false, true, context),
                _buildcard('Clog', '\$399', 'assets/images/shoes7.jpeg', false, true, context),
                _buildcard('Clog', '\$399', 'assets/images/shoes7.jpeg', false, true, context),
              ],),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.pink,
        child: Icon(Icons.shopping_cart_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
  //===================================================================================================================>
  Widget _buildcard(String name , String Price , String imgPath, bool added, bool isFavourite, context){
    return Padding (
      padding: EdgeInsets.only(top: 5.0, bottom: 2.0, left: 5.0,right: 5.0),
      child: InkWell(
        onTap: ()
        {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(
                  assetPath: imgPath,
                  cookieprice: Price,
                  cookiename: name)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5.0,
                )
              ],
              color: Colors.white
          ),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    isFavourite? Icon(Icons.favorite, color: Color(0xFFEF7532)):
                    Icon(Icons.favorite_border,color: Color(0xFFEF7532),)
                  ],
                ),
              ),
              Hero(tag: imgPath, child: Container(
                height: 90.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage(imgPath,),
                        fit:BoxFit.contain
                    )
                ),
              )
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(Price,style: TextStyle(
                  color: Color(0xFFEF7532),
                  fontFamily: 'lora',
                  fontSize: 12.5
              ),),
              Text(name,style: TextStyle(
                  color: Color(0xFFEF7532),
                  fontFamily: 'lora',
                  fontSize: 14.5
              ),),
              Padding(padding: EdgeInsets.all(8.0),
                child: Container(
                  color:  Color(0xFFEF7532),
                  height: 1.0,
                ),),
              Padding(padding: EdgeInsets.only(left: 5.0,right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(!added) ...[
                      Text('Add to cart',style: TextStyle(fontSize: 12.0,fontFamily: 'lora'),),
                      Icon(Icons.shopping_cart_outlined,color: Color(0xFFEF7532),size: 12.0,),
                    ],
                    if(!added) ...[
                      Text('3',style: TextStyle(fontSize: 12.0,fontFamily: 'lora'),),
                      Icon(Icons.remove_circle_outline,color: Color(0xFFEF7532),size: 12.0,),
                    ]
                  ],
                  //],
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
