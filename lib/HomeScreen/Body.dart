import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:test_icebergdevelopers/Base/Base.dart';
import 'package:test_icebergdevelopers/Models/CategoriesModel.dart';
import 'package:test_icebergdevelopers/Models/Productsmodel.dart';

import '../Base/Base.dart';
import 'ColorConstant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Future<ProductsModel > _getdatafuture;
  List<ProductsModel> _productslist;
  Future<CategoriesModel > _getcategoryfuture;
  List<CategoriesModel> _categorylist;
  List<String> images = [];
  bool flag  = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = ['https://images.unsplash.com/photo-1639501838991-215ffc3cf280?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    'https://images.unsplash.com/photo-1639414442418-2b095bdbb267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80',
      'https://images.unsplash.com/photo-1639402479773-c1691911bf6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
      'https://images.unsplash.com/photo-1639405137370-5ab16e0cd9fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
      'https://images.unsplash.com/photo-1639422839168-ba0bd0d21d8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'
    ];
    _getdatafuture = getProducts().then((value) {
      _productslist = value;
      _getcategoryfuture = getCategories().then((value){
        _categorylist = value;
        setState(() {
          flag = false;
        });
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: RichText(
          text: TextSpan(

            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: 'A B A ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
              TextSpan(text: ' Y',style: TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold,)),
              TextSpan(text: ' A',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
            ],
          ),

        ),),
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.menu,color: Colors.black,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [

          IconButton(
              icon: Icon(

                Icons.search_rounded,
                color: Colors.black,
              ),
            onPressed: (){
              _scaffoldKey.currentState.openDrawer();
            },
          )
        ],

      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.maps_ugc),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.person),
          ),
          BottomNavigationBarItem(
            title: Text(''),
            icon: Icon(Icons.shopping_cart),
          ),

        ],
      ),
      drawer: new Drawer(
        child: Column(
          children: [
            Text('adad')
          ],
        ),
      ),



      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Categories',style: TextStyle(color:Colors.black),),

          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: new Icon(Icons.menu,color: Colors.black,),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            IconButton(icon: Icon(Icons.menu,color: Colors.black,), onPressed: (){

            })
          ],
        ),
        endDrawer: flag?Center(
          child: SpinKitCircle(
            color: Colors.blueGrey.shade900,
            size: 50.0,
          ),
        ):Drawer(
          child: Container(
            width: MediaQuery.of(context).size.width  ,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: _categorylist.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Text(_categorylist[index].categoryName)
                  ],
                );
              },
            ),
          ),
        ),
        body: flag?Center(
          child: SpinKitCircle(
            color: Colors.blueGrey.shade900,
            size: 50.0,
          ),
        ): Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,top: 30,bottom: 30),
                child: RichText(
                  text: TextSpan(

                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(text: 'Trending', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                      TextSpan(text: ' Now',style: TextStyle(color: Colors.orange,fontSize: 25)),
                    ],
                  ),
                ),
              ),
              myWidget(context)
            ]
        )
        ),
      );

  }
  Widget myWidget(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Expanded(
        child: GridView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: _productslist.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.3,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: Image.network(images[index],fit: BoxFit.cover,)),
                  Text(
                    _productslist[index].brandName,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 18.0),
                    ),
                  Text('PKR:590',style: TextStyle(color: Colors.yellow[500]),)

                ],
              );
            }
        ),
      ),
    );
  }
}
