import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:onstaraapplication/home_screen/shirt_screen/shirt_main_page.dart';
import 'package:onstaraapplication/home_screen/shoes_screen/shoes_pages.dart';

import '../authentication/login_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //=============================================================================>
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _signOut() async {
    await _auth.signOut();
  }
  //=============================================================================>
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
              title: Center(child: Text('Homepage' ,style: TextStyle(color: Colors.indigo,fontFamily: 'regular',fontSize: 25.5,fontWeight: FontWeight.bold),)),
          backgroundColor: Colors.white,
          elevation: 0,

          actions: [
            IconButton(onPressed: (){
              _signOut();
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn()), (route) => false);

            }, icon: Icon(Icons.logout,color: Colors.pink,))

            ///====================================================================================================================================================>
          ],
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
