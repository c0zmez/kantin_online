import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';

class TransactionCard extends StatefulWidget {

  String? nameFood;
  int price;
  String? image;

  TransactionCard({Key? key,
    required this.nameFood,
    required this.price,
    required this.image
  }) : super(key: key);

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 5,
          )
        ]
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20,left: 20),
                child: Text(
                    '${widget.nameFood}',
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700)
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: Row(
              children: <Widget>[
                Container(
                  child: Image.asset(
                    '${widget.image}',
                    width: 95,
                    height: 95,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 25, bottom: 10),
                  child: Container(
                    height: 75,
                    width: 150,
                    decoration: BoxDecoration(
                      color: colorGrey2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Rp${widget.price}',
                              maxLines: 1,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                  '1 Jan 2022 - 07.00',
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  )
                              ),
                            )
                          ],
                        ) ,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
