import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/cart_add_provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/favourite_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              "Cart Products",
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
          body: (provider.cartProduct.isNotEmpty)
              ? ListView.builder(
                  itemCount: provider.cartProduct.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                              provider.cartProduct[index].thumbnail),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            (Provider.of<FaouriteProvider>(context).added ==
                                    false)
                                ? Provider.of<FaouriteProvider>(context)
                                    .addToFavourite(
                                        product: provider.cartProduct[index])
                                : Provider.of<FaouriteProvider>(context)
                                    .removeFromFavourite(
                                    product: provider.cartProduct[index],
                                  );
                          },
                          icon: (Provider.of<FaouriteProvider>(context).added ==
                                  false)
                              ? Icon(
                                  Icons.favorite_outline,
                                  color: Colors.blue.shade500,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.amber,
                                ),
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "There is no Cart Products",
                    style: TextStyle(
                        color: Colors.blue.shade500,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
        );
      },
    );
  }
}
