import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/views/transactions/check_view.dart';
import 'package:kantin_online/ui/widgets/cardwidgets/cart_card.dart';
import 'package:kantin_online/viewmodels/cart_view_model.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  _CartViewState createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {

  int counter = 1;

  void incrementCounter() {
    setState(() {
      if (counter == 99) {
        return null;
      }
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter == 0) {
        return null;
      }
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
        viewModelBuilder: () => CartViewModel(),
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.black
            ),
            title: Text('Keranjang', style: TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Poppins', color: colorRed),),
            backgroundColor: colorWhite,
            elevation: 0,
          ),
          body: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.9,
              child: ListView(
                children: const [
                  CartCard(
                      image: 'assets/chicken.png',
                      name: 'Ayam Goreng',
                      price: 'Rp 24.000'
                  ),
                  CartCard(
                      image: 'assets/frenchfries.png',
                      name: 'Kentang Gorang',
                      price: 'Rp 15.000'
                  ),
                  CartCard(
                      image: 'assets/aqua.png',
                      name: 'Air Mineral',
                      price: 'Rp 5.000'
                  ),
                  CartCard(
                      image: 'assets/boba.png',
                      name: 'Booca',
                      price: 'Rp 20.000'
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 60,
            width: MediaQuery.of(context).size.width*0.8,
            margin: const EdgeInsets.only(bottom: 15),
            child: FloatingActionButton.extended(
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckView()));
              },
              label: const Text('Periksa', style: TextStyle(color: Colors.white, fontSize: 20),),
              backgroundColor: colorRed,
            ),
          ),
        )
    );
  }
}
