import 'package:test_icebergdevelopers/Models/Productsmodel.dart';
import 'package:http/http.dart' as http;

String Base_Url = 'https://ime.geu.mybluehost.me/api/';
String khimember = 'getproducts';


Future<List<ProductsModel>> getProducts() async  {
  List<ProductsModel> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+khimember);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = productsModelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }
}