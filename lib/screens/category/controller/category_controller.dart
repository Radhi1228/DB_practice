import 'package:db_practice/screens/category/model/category_model.dart';
import 'package:db_practice/utils/helper/db_helper.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController
{
  DBHelper helper = DBHelper();
  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;

  void getCategory() async
  {
    categoryList.value = await helper.readDB();
  }
}