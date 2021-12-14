import 'package:flutter/material.dart';
import 'package:test_icebergdevelopers/Base/Base.dart';
import 'package:test_icebergdevelopers/Models/Productsmodel.dart';

import 'ColorConstant.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<ProductsModel > _getdatafuture;
  List<ProductsModel> _productslist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getdatafuture = getProducts().then((value) {
      _productslist = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('adsdasdas')),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: ColorConstant.Appbar_Color,
              ),
            onPressed: (){

            },
          )
        ],

      ),
      drawer: Drawer(
        child: Column(
          children: [
            Text('adad')
          ],
        ),
      ),



      body: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
        ),
        endDrawer: Drawer(
          child: Text('adsad'),
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(

                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(text: 'Trending', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
                    TextSpan(text: ' Now',style: TextStyle(color: Colors.orange,fontSize: 25)),
                  ],
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
            itemCount: 300,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.3,
                  height: MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: Image.network('https://images.unsplash.com/photo-1639435943487-0de285b269a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',fit: BoxFit.cover,)),
                  Expanded(
                    child: Text(
                      "TOP ADasd asdadDE asasdasda asdasdas asdasdasdasd adasddasdD",

                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 18.0),
                      ),
                  )

                ],
              );
            }
        ),
      ),
    );
  }
}
