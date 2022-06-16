import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';
import 'package:kantin_online/ui/widgets/cardwidgets/food_card.dart';
import 'package:kantin_online/viewmodels/product_view_model.dart';
import 'package:stacked/stacked.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {

  TextEditingController controllerSearch = TextEditingController();

  Widget? searchTextField = Container(
    padding: const EdgeInsets.only(),
    child: const Text(
      'Daftar Produk',
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
    ),
  );


  bool search = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
      viewModelBuilder: () => ProductViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 2,
          toolbarHeight: MediaQuery.of(context).size.height*0.1,
          backgroundColor: colorRed,
          actions: <Widget>[
            (search == false)
                ? IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searchTextField = appSearch(context);
                    search = true;
                  });
                })
                : IconButton(
                icon: const Icon(
                  Icons.close,
                  color: colorWhite,
                ),
                onPressed: () {
                  setState(() {
                    searchTextField = Text(
                      'Daftar Produk',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'Poppins'),
                    );
                    search = false;
                    controllerSearch.clear();
                  });
                }
            ),
            IconButton(
                onPressed: (){
                  model.navigateToCartView();
                },
                icon: const Icon(Icons.add_shopping_cart_outlined)
            ),
          ],
          title: searchTextField
        ),
        body: ListView(
          children: <Widget>[
            FoodCard(
                image: 'assets/chicken.png',
                name: 'Ayam Goreng',
                value: 'Rp 24.000',
                // image: Image.asset('./assets/chicken.png'),
            ),
            FoodCard(
                image: 'assets/frenchfries.png',
                name: 'Kentang Gorang',
                value: 'Rp 15.000',
                // image: Image.asset('./assets/boba.png'),
            ),
            FoodCard(
              image: 'assets/aqua.png',
              name: 'Air Mineral',
              value: 'Rp 5.000',
              // image: Image.asset('./assets/chicken.png'),
            ),
            FoodCard(
              image: 'assets/sprite.png',
              name: 'Sprote',
              value: 'Rp 7.500',
              // image: Image.asset('./assets/boba.png'),
            ),
            FoodCard(
              image: 'assets/icecream.png',
              name: 'Sundae Chocolate',
              value: 'Rp 23.000',
              // image: Image.asset('./assets/chicken.png'),
            ),
            FoodCard(
              image: 'assets/boba.png',
              name: 'Booca',
              value: 'Rp 20.000',
              // image: Image.asset('./assets/boba.png'),
            ),
            verticalSpaceMedium
          ],
        )
      ),
    );
  }

  Widget appSearch(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.7,
      child: TextField(
        controller: controllerSearch,
        style: const TextStyle(color: colorWhite, fontSize: 18),
        decoration: const InputDecoration(
          enabledBorder:  UnderlineInputBorder(
              borderSide: BorderSide(
                color: colorWhite,
                width: 2,
              )
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: colorWhite,
                width: 2,
              )
          ),
          hoverColor: colorWhite,
          contentPadding: EdgeInsets.only(bottom: 0),
            hintText: "Cari Disini...",
            hintStyle: TextStyle(color: colorWhite),
        ),
      ),
    );
  }

}
