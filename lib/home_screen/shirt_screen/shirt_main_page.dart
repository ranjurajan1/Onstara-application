
import 'package:flutter/material.dart';
import 'package:onstaraapplication/home_screen/shirt_screen/shirt_detail_page.dart';

import '../../bottombar_widgets/bottom_bar.dart';
class ShirtPage extends StatefulWidget {
  final assetPath, cookieprice , cookiename;
 ShirtPage({this.assetPath, this.cookieprice,this.cookiename});

  // const cookiePage({Key? key}) : super(key: key);

  @override
  State<ShirtPage> createState() => _ShirtPageState();
}

class _ShirtPageState extends State<ShirtPage> {
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
              _buildcard('Polo Shirt', '\$399', 'assets/images/shirt1.jpeg', false, true, context),
              _buildcard('Crew Neck', '\$43.2', 'assets/images/shirt2.jpeg', false, true, context),
              _buildcard('Pocket', '\$199', 'assets/images/shirt11.jpeg', false, true, context),
              _buildcard('cookiemint', '\$599', 'assets/images/shirt5.jpeg', false, true, context),
              _buildcard('cookiemint', '\$899', 'assets/images/shirt6.jpeg', false, true, context),
              _buildcard('Hooded', '\$399', 'assets/images/shirt3.jpeg', false, true, context),
              _buildcard('cookiemint', '\$299', 'assets/images/shirt5.jpeg', false, true, context),
              _buildcard('Henley', '\$600', 'assets/images/shirt9.jpeg', false, true, context),
              _buildcard('Hooded', '\$399', 'assets/images/shirt3.jpeg', false, true, context),
              _buildcard('Striped', '\$699', 'assets/images/shirt6.jpeg', false, true, context),
              _buildcard('V-Neck', '\$199', 'assets/images/shirt7.jpeg', false, true, context),
              _buildcard('U-Neck', '\$399', 'assets/images/shirt8.jpeg', false, true, context),
              _buildcard('Striped', '\$699', 'assets/images/shirt6.jpeg', false, true, context),
              _buildcard('Thin-long', '\$599', 'assets/images/shirt4.jpeg', false, true, context),
              _buildcard('Graphic', '\$699', 'assets/images/shirt10.jpeg', false, true, context),
              _buildcard('Pocket', '\$199', 'assets/images/shirt11.jpeg', false, true, context),
              _buildcard('hoodie', '\$199', 'assets/images/shirt1.jpeg', false, true, context),
              _buildcard('pocket', '\$299', 'assets/images/shirt2.jpeg', false, true, context),
              _buildcard('Grahic', '\$699', 'assets/images/shirt3.jpeg', false, true, context),
              _buildcard('Thin-long', '\$955', 'assets/images/shirt4.jpeg', false, true, context),
              _buildcard('Striped', '\$599', 'assets/images/shirt5.jpeg', false, true, context),
              _buildcard('V-neck', '\$899', 'assets/images/shirt6.jpeg', false, true, context),
              _buildcard('Striped', '\$899', 'assets/images/shirt7.jpeg', false, true, context),
              _buildcard('Hodded', '\$299', 'assets/images/shirt2.jpeg', false, true, context),
              _buildcard('Thin', '\$699', 'assets/images/shirt3.jpeg', false, true, context),
              _buildcard('Graphic', '\$299', 'assets/images/shirt5.jpeg', false, true, context),
              _buildcard('Henley', '\$600', 'assets/images/shirt9.jpeg', false, true, context),
              _buildcard('Hooded', '\$399', 'assets/images/shirt3.jpeg', false, true, context),
              _buildcard('Striped', '\$699', 'assets/images/shirt6.jpeg', false, true, context),
              _buildcard('V-Neck', '\$199', 'assets/images/shirt7.jpeg', false, true, context),
              _buildcard('U-Neck', '\$399', 'assets/images/shirt8.jpeg', false, true, context),
              _buildcard('Striped', '\$699', 'assets/images/shirt6.jpeg', false, true, context),
              _buildcard('Thin-long', '\$599', 'assets/images/shirt4.jpeg', false, true, context),
              _buildcard('Graphic', '\$699', 'assets/images/shirt10.jpeg', false, true, context),
              _buildcard('Pocket', '\$199', 'assets/images/shirt11.jpeg', false, true, context),
              _buildcard('Striped', '\$699', 'assets/images/shirt6.jpeg', false, true, context),
            ],),
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.indigoAccent,
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
