import 'package:flutter/material.dart';
import 'package:onstaraapplication/home_screen/shoes_screen/shoes_pages.dart';
class Successpage extends StatefulWidget {
  const Successpage({Key? key}) : super(key: key);

  @override
  State<Successpage> createState() => _SuccesspageState();
}

class _SuccesspageState extends State<Successpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //       onPressed: (() {
      //         Navigator.pop(context);
      //       }),
      //       icon: Icon(
      //         Icons.arrow_back_ios_new,
      //         size: 20,
      //         color: Color.fromARGB(255, 153, 115, 25),
      //       )),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   actions: [
      //     Icon(Icons.notifications_none,  color: Color.fromARGB(255, 153, 115, 25)),
      //   ],
      // ),
      ///Appbar closed here----------------------------------------------------------------------------------------->

      body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.check_circle,
                  color: Color.fromARGB(255, 153, 115, 25),
                  size: 40,
                ),
                SizedBox(
                  height: 20,
                ),

                Text('Thank You',style: TextStyle(fontFamily: 'clanbook',fontSize: 20,color: Colors.black),),
                SizedBox(
                  height: 20,
                ),
                Text('Your delivery request has been placed. ',style: TextStyle(fontFamily: 'clanbook',fontSize: 13,color: Colors.black),),
                SizedBox(
                  height: 5,
                ),
                Text( 'Please wait for our  team to',style: TextStyle(fontFamily: 'clanbook',fontSize: 13,color: Colors.black)),
                SizedBox(
                  height: 5,
                ),

                Text('contact you',style: TextStyle(fontFamily: 'clanbook',fontSize: 13,color: Colors.black)),
                SizedBox(
                  height: 20,
                ),

                Column(
                  children: [
                    // Text(('kkk')),
                    Image.asset('assets/images/order.jpeg',width: 300),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/order.jpeg',width: 300),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
// --------------------------------------------------------------------------------------------------------------------------->
// /To remove items in index=========================================================================================>

                GestureDetector(
                  onTap: (() {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ShoesPages(),
                      ),
                          (route) => false,
                    );

                  }),

                  child:Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      width: 0.55*MediaQuery.of(context).size.width,
                      height: 55,
                      child: Center(
                        child: Text('OK',style: TextStyle(fontFamily: 'regular',fontSize: 13,color: Colors.white,fontWeight: FontWeight.bold
                        )
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 153, 115, 25)),
                    ),
                  ),),
                SizedBox(
                  height: 20,
                ),
                //----------------------------------------------------------------------------------------------------------------------------->

              ],
            ),
          )
      ),

      ///------------------------------------------------------------------------------------------------------------------------------------>
      ///
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.red,
        backgroundColor: Color.fromARGB(255, 41, 31, 29),

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Home Info',
            backgroundColor: Color.fromARGB(255, 41, 31, 29),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services),
              label: 'Book',
              backgroundColor: Color.fromARGB(255, 41, 31, 29)),
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              label: 'Check-in',
              backgroundColor: Color.fromARGB(255, 41, 31, 29)),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: 'Chat',
              backgroundColor: Color.fromARGB(255, 41, 31, 29)),
        ],
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        selectedItemColor: Color.fromARGB(255, 153, 115, 23),
      ),//
    );
  }
}
