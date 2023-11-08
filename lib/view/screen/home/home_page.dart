import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_d_anurag_1786/helper/api_helper.dart';
import 'package:task_d_anurag_1786/helper/firstore_helper.dart';
import 'package:task_d_anurag_1786/view/screen/home/model/product_model.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/cart_add_provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/favourite_page.dart';
import 'package:task_d_anurag_1786/view/screen/login/model/login_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 210) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "My Cart",
          style: GoogleFonts.sofia(
            color: Colors.blue.shade500,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("fav_page");
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.blue.shade500,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed("cart_page");
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.blue.shade500,
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.blue.shade500,
          ),
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: (itemWidth / itemHeight),
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Hero(
                          tag: "image",
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("detail_page", arguments: index);
                            },
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    snapshot.data![index].thumbnail,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data![index].title,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue.shade500,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                snapshot.data![index].title,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.blue.shade300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                Provider.of<FaouriteProvider>(context)
                                    .addToFavourite(
                                        product: snapshot.data![index]);
                              },
                              icon: (Provider.of<FaouriteProvider>(context)
                                          .added ==
                                      false)
                                  ? Icon(
                                      Icons.favorite_outline,
                                      color: Colors.blue.shade500,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.amber,
                                    ),
                            ),
                            IconButton(
                              onPressed: () {
                                Provider.of<CartProvider>(context)
                                    .addToCart(product: snapshot.data![index]);
                              },
                              icon: (Provider.of<CartProvider>(context).added ==
                                      false)
                                  ? Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.blue.shade500,
                                    )
                                  : Icon(
                                      Icons.shopping_cart,
                                      color: Colors.amber,
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          spreadRadius: 5,
                          offset: Offset(5, 5),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("There is no Data Found");
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          }
        },
      ),
    );
  }
}
