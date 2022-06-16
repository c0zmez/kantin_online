import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';

class CartCard extends StatefulWidget {
  final String? image;
  final String? name;
  final String? price;

  const CartCard({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
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
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(left: 15),
          decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 130,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
                decoration: const BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey, blurRadius: 8, offset: Offset(0, 0))
                    ]),
                child: Center(
                  child: Image.asset('${widget.image}',
                    width: 70,
                    height: 70,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '${widget.name}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      width: MediaQuery.of(context).size.width*0.55,
                    ),
                    Column(
                      children: [
                        Container(
                          child: Text(
                            '${widget.price}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          width: MediaQuery.of(context).size.width*0.55,
                        ),
                        verticalSpaceMedium,
                        Container(
                          width: MediaQuery.of(context).size.width*0.45,
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: GestureDetector(
                                    onTap: decrementCounter,
                                    child: Icon(
                                      Icons.remove,
                                      color: colorRed,
                                      size: 17,
                                    )),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 6, right: 6),
                                  child: Text(
                                    '$counter',
                                    style: TextStyle(fontSize: 15),
                                  )),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: GestureDetector(
                                    onTap: incrementCounter,
                                    child: Icon(
                                      Icons.add,
                                      color: colorRed,
                                      size: 17,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.all(8),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close, size: 20,)
            ),
          ),
        )
      ],
    );
  }
}
