import 'package:flutter/material.dart';

import '../../bottombar_widgets/bottom_bar.dart';

class ShoesDetails extends StatelessWidget {
  final assetPath, cookieprice, cookiename;
  ShoesDetails({this.assetPath, this.cookieprice, this.cookiename});
  // const ShoesDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),

      body: ListView(
          children: [
            SizedBox(height: 15.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                  'Cookie',
                  style: TextStyle(
                      fontFamily: 'lora',
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))
              ),
            ),
            SizedBox(height: 15.0),
            Hero(
                tag: assetPath,
                child: Image.asset(assetPath,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.contain
                )
            ),
            SizedBox(height: 20.0),
            Center(
              child: Text(cookieprice,
                  style: TextStyle(
                      fontFamily: 'lora',
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF17532))),
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(cookiename,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'lora',
                      fontSize: 24.0)),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text('For Guys, the joys of rocking a fresh pair of shoes cant be understated.Wheether you are heading to work,happy hour ,the gym, a wedding orthe beach,footwear is an essentialcomponent of every ensemble',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'lora',
                        fontSize: 16.0,
                        color: Color(0xFFB4B8B9))
                ),
              ),
            ),
            SizedBox(height: 20.0),
            GestureDetector(
              onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoesDetails()));
                  }

            ),
            Center(
                child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        // color: Color(0xFFF17532)
                      color: Colors.blue
                    ),
                    child: Center(
                        child: Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'regular',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        )
                    )
                )
            )
          ]
      ),

      floatingActionButton: FloatingActionButton(onPressed: () {},
        backgroundColor: Colors.indigoAccent,
        child: Icon(Icons.shopping_cart_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
