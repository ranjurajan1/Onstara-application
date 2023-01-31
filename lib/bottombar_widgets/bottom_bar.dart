import 'package:flutter/material.dart';
import 'package:onstaraapplication/home_screen/shirt_screen/shirt_main_page.dart';

import '../home_screen/shoes_screen/shoes_pages.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
  return BottomAppBar(
        shape: CircularNotchedRectangle(),
    notchMargin: 6.0,
    color: Colors.transparent,
    elevation: 9.0,
    clipBehavior: Clip.antiAlias,
    child: Container(
    height: 50.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0)
    ),
    // color:Color.fromARGB(255, 41, 31, 29)
    //   color: Color.fromARGB(255, 153, 115, 25),
      color:  Color(0xFFEF7532),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    height: 50.0,
    width: MediaQuery.of(context).size.width /2 - 40.0,
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoesPages()));
          },
      ),
      IconButton(
        icon: Icon(Icons.person_outline_sharp, color: Colors.white),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShirtPage()));
          },
      ),
    ],
    )
    ),
        Container(
                   height: 50.0,
                    width: MediaQuery.of(context).size.width /2 - 40.0,
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                 IconButton(
                                  icon: Icon(Icons.search, color: Colors.white),
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShirtPage()));
                                      },
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
                                        onPressed: () {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShoesPages()));
                                                          },
                                                        ),
                                                      ],
                                                  )
                                                  ),
                                             ]
                                          )
                                          )
                                      );
                                    }
                                  }
// Color(0xFF676E79)