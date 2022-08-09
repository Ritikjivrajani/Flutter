import 'package:first_app/models/catalog.dart';
import 'package:first_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final int days = 50;
  final String name = "Ritik";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    // ignore: prefer_typing_uninitialized_variables
    var catalogModel;
    catalogModel.Items =
        List.from(productData).map<Item>((item) => Item.formMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var catalogModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Iphone"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          // itemCount: catalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: catalogModel.Items[index],
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
