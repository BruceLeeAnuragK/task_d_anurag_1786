import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/cart_add_provider.dart';
import 'package:task_d_anurag_1786/view/screen/home/provider/favourite_page.dart';

import '../../../helper/api_helper.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FaouriteProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              "Favourites",
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
          body: (provider.favProduct.isNotEmpty)
              ? ListView.builder(
                  itemCount: provider.favProduct.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                              provider.favProduct[index].thumbnail),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            (Provider.of<FaouriteProvider>(context).added ==
                                    false)
                                ? Provider.of<FaouriteProvider>(context)
                                    .addToFavourite(
                                        product: provider.favProduct[index])
                                : Provider.of<FaouriteProvider>(context)
                                    .removeFromFavourite(
                                    product: provider.favProduct[index],
                                  );
                          },
                          icon: (Provider.of<FaouriteProvider>(context).added ==
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
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                    "There is no Favourites",
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
