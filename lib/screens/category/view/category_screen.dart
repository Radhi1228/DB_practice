import 'package:db_practice/screens/category/controller/category_controller.dart';
import 'package:db_practice/utils/helper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtAlertDialogue = TextEditingController();
  CategoryController controller = Get.put(CategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: txtCategory,
                    decoration: const InputDecoration(
                      //prefixIcon: Icon(Icons.done,),
                      border: OutlineInputBorder(),
                      label: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text('Category'),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    DBHelper dbHelper = DBHelper();
                    dbHelper.insertDB(txtCategory.text);
                    controller.getCategory();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
          ListView.builder(
            itemBuilder: (context, index) {
              return ExpansionTile(
                title: Text(controller.categoryList[index].name!),
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          txtAlertDialogue.text =
                              controller.categoryList[index].name!;

                          Get.defaultDialog(
                            title: "Update",
                            content: TextField(
                              controller: txtAlertDialogue,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text("Category"),
                              ),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  await controller.helper.updateDB(
                                      txtAlertDialogue.text,
                                      controller.categoryList[index].id!);

                                  Get.back();
                                  controller.getCategory();
                                },
                                child: const Text("Update"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  Get.back();
                                },
                                child: const Text("Cancel"),),
                            ],);
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                          onPressed: () async {
                            await controller.helper
                                .deleteDB(controller.categoryList[index].id!);
                            controller.getCategory();
                          },
                          icon: const Icon(Icons.delete)),
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
