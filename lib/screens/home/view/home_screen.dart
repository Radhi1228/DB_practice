import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Budget Manager"),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/category');
          }, icon: const Icon(Icons.apps)),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text("$index"),
          );
        },),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed('/entry');
      },child: const Icon(Icons.add)),
    );
  }
}
