import 'package:flutter/material.dart';
import 'package:onstaraapplication/home_screen/shirt_screen/shirt_main_page.dart';
import 'package:onstaraapplication/home_screen/shoes_screen/shoes_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
              title: Center(child: Text('Homepage' ,style: TextStyle(color: Colors.indigo,fontFamily: 'regular',fontSize: 25.5,fontWeight: FontWeight.bold),)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom:
          TabBar(indicatorColor: Colors.pink,
              tabs: [
                Tab(
                  child: Text(
                      'Shirts',
                      style: TextStyle(color:Colors.pink,fontSize: 18,fontFamily: 'regular',fontWeight:FontWeight.bold,)
                  ),
                ),
                Tab(
                    child: Text(
                      'shoes',
                      style: TextStyle (color:Colors.pink, fontSize: 18,fontFamily: 'regular',fontWeight:FontWeight.bold,
                      ),
                    )
                )]), //-----------------------------------appbar closed here------------------------------>
        ),
        body: TabBarView(
          children: [ShirtPage(),ShoesPages()],
        ),
      ),
    );
  }
}
