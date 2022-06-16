import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';

class OrderDetailWidget extends StatefulWidget {

  final String? food;
  final String? price;

  const OrderDetailWidget({
    Key? key, required this.food, required this.price
  }) : super(key: key);

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.87,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          SizedBox(
            width: MediaQuery.of(context).size.width*0.435,
            child: Text(
              '${widget.food}',
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.435,
            child: Text(
              'Rp ${widget.price}',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.right,
            ),
          ),
          verticalSpaceVeryTiny
        ],
      ),
    );
  }
}
