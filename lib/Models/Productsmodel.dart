// To parse this JSON data, do
//
//     final productsModel = productsModelFromJson(jsonString);

import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) => List<ProductsModel>.from(json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    this.id,
    this.productName,
    this.productDescription,
    this.subCategoryId,
    this.supplierId,
    this.brandId,
    this.imagePath,
    this.isDiscontinued,
    this.createdAt,
    this.updatedAt,
    this.categoryName,
    this.subCategoryName,
    this.brandName,
    this.supplierName,
  });

  int id;
  String productName;
  String productDescription;
  int subCategoryId;
  int supplierId;
  int brandId;
  String imagePath;
  int isDiscontinued;
  DateTime createdAt;
  DateTime updatedAt;
  String categoryName;
  String subCategoryName;
  String brandName;
  String supplierName;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
    id: json["id"],
    productName: json["ProductName"],
    productDescription: json["ProductDescription"],
    subCategoryId: json["SubCategoryId"],
    supplierId: json["SupplierId"],
    brandId: json["BrandId"],
    imagePath: json["ImagePath"],
    isDiscontinued: json["is_discontinued"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categoryName: json["CategoryName"],
    subCategoryName: json["SubCategoryName"],
    brandName: json["BrandName"],
    supplierName: json["SupplierName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "ProductName": productName,
    "ProductDescription": productDescription,
    "SubCategoryId": subCategoryId,
    "SupplierId": supplierId,
    "BrandId": brandId,
    "ImagePath": imagePath,
    "is_discontinued": isDiscontinued,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "CategoryName": categoryName,
    "SubCategoryName": subCategoryName,
    "BrandName": brandName,
    "SupplierName": supplierName,
  };
}
