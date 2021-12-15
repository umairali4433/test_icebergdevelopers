import 'package:flutter/material.dart';
import 'package:test_icebergdevelopers/Models/Productsmodel.dart';

class CardExample extends StatefulWidget {

  String image;
  ProductsModel productslist;


  CardExample(this.image, this.productslist);

  @override
  _CardExampleState createState() => _CardExampleState();
}

class _CardExampleState extends State<CardExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(child: Image.network(widget.image,fit: BoxFit.cover,)),
              Text(
                widget.productslist.brandName,style: TextStyle(fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Text(
                'PKR 590',style: TextStyle(fontSize: 15,color: Colors.orange[500]),
                textAlign: TextAlign.start,
              ),



            ],
          ),
        ),
      ),
    );
  }
}