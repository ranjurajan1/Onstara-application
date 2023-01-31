// import 'package:flutter/material.dart';
// import 'package:onstaraapplication/home_screen/shirt_screen/shirt_main_page.dart';
// import 'bottombar_widgets/bottom_bar.dart';
// import 'home_screen/shoes_screen/shoes_pages.dart';
//
// //==============================================================================================>
//
//  class HomePages extends StatefulWidget {
//   const HomePages({Key? key}) : super(key: key);
//
//   @override
//   State<HomePages> createState() => _HomePagesState();
//
// }
// class _HomePagesState extends State<HomePages>{
// @override
// Widget build(BuildContext context) {
//   return DefaultTabController(
//     length: 2,
//     child: Scaffold(
//     //   appBar: AppBar(
//     //     title: Center(child: Text('Homepage' ,style: TextStyle(color: Colors.black,fontFamily: 'lora'),)),
//     //     backgroundColor: Colors.white,
//     //     elevation: 0,
//     //     leading:  Icon(
//     //       Icons.notifications_none,
//     //       color: Colors.pink,
//     //     ),
//     //     actions: [
//     //       Icon(
//     //         Icons.notifications_none,
//     //         color: Colors.pink,
//     //       )
//     //     ],
//     //     bottom:
//     //     TabBar(indicatorColor: Colors.pink,
//     //         tabs: [
//     //           Tab(
//     //             child: Text(
//     //                 'Shirts',
//     //                 style: TextStyle(color:Colors.black,fontSize: 12,fontFamily: 'clanbook',fontWeight:FontWeight.bold,)
//     //             ),
//     //           ),
//     //           Tab(
//     //               child: Text(
//     //                 'shoes',
//     //                 style: TextStyle (color:Colors.black, fontSize: 12,fontFamily: 'lora',fontWeight:FontWeight.bold,
//     //                 ),
//     //               )
//     //           )]), //-----------------------------------appbar closed here------------------------------>
//     //   ),
//     //   body: TabBarView(
//     //     children: [ShirtPage(),ShoesPages()],
//     //   ),
//     // ),
//   ));
// }
//   // with SingleTickerProviderStateMixin {
//   // late TabController _tabController;
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
//   // }
//   //
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       elevation: 0,
//   //       centerTitle:  true,
//   //       backgroundColor: Colors.white,
//   //       leading: IconButton(
//   //         icon:Icon(Icons.arrow_back,color:Colors.red,),
//   //         onPressed: ()
//   //         {
//   //
//   //         }
//   //       ),
//   //       actions: [
//   //    IconButton(
//   //   icon:Icon(Icons.notifications_none,color: Colors.red,),
//   //   onPressed: ()
//   //   {
//   //     Navigator.pop(context);
//   //
//   //   }
//   //    )],
//   //       title: Text('PICK UP',style: TextStyle(color: Colors.black,fontFamily: 'lora'),),
//   //
//   //     ),
//   //
//   //     body:ListView(
//   //       padding: EdgeInsets.only(left: 20.0),children: [
//   //         SizedBox(
//   //           height: 15.0,
//   //         ),
//   //       Text('Catagories',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'lora'),),
//   //       SizedBox(
//   //         height: 15,
//   //       ),
//   //     TabBar(
//   //         controller: _tabController,
//   //         isScrollable :false,
//   //        labelPadding: EdgeInsets.only(right: 45.0),
//   //    unselectedLabelColor: Colors.white24
//   //    ,indicatorColor: Color.fromARGB(255, 153, 115, 25),
//   //         tabs: [
//   //           Tab(
//   //             child: Text(
//   //                 'Shirtsss',
//   //                 style: TextStyle(color:Color.fromARGB(255, 153, 115, 25),fontSize: 12,fontFamily: 'lora',fontWeight:FontWeight.bold)
//   //             ),
//   //           ),
//   //           SizedBox(
//   //             width: 100,
//   //           ),
//   //           Tab(
//   //               child: Text(
//   //                 'Jeanssss',
//   //                 style: TextStyle (color:Color.fromARGB(255, 153, 115, 25), fontSize: 12,fontFamily: 'lora',fontWeight:FontWeight.bold,
//   //                 ),
//   //               )
//   //           )]),
//   //       // TabBarView(
//   //       //   children: [cookiePage(),ShoesPages()],
//   //       // ),
//   //
//   //       Container(
//   //         height: MediaQuery.of(context).size.height -50.0,
//   //         width: double.infinity,
//   //         child: TabBarView(
//   //           controller: _tabController,
//   //           children: [
//   //             ShirtPage(),
//   //             ShoesPages()
//   //           ],
//   //         )
//   //       ),
//   //   ]),
//   //     floatingActionButton: FloatingActionButton(
//   //       onPressed: (){},
//   //       backgroundColor: Colors.pink,
//   //       child: Icon(Icons.shopping_cart_rounded),
//   //     ),
//   //     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//   //     bottomNavigationBar: BottomBar(),//-----------------------------------appbar closed here------------------------------>
//   //   );
//   // }
// }
