import 'package:get/get.dart';

class CategoryModel extends GetxController
{
  String? name;
  int? id;

  CategoryModel({this.name, this.id});
  factory CategoryModel.mapToModel(Map m1)
  {
    return CategoryModel(
      name: m1['name'],id:m1['cid']);
  }
}