import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helper/api_helper.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text(
            "Product Details",
            style: GoogleFonts.sofia(
              color: Colors.blue.shade500,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.blue.shade500,
            ),
            onPressed: () {
              setState(
                () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Hero(
                tag: "image",
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        APIHelper.apiHelper.Products[index].thumbnail,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                APIHelper.apiHelper.Products[index].description,
                style: TextStyle(
                  color: Colors.blue.shade500,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ));
  }
}
