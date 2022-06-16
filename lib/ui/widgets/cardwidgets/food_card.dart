import 'package:flutter/material.dart';
import 'package:kantin_online/constants/colors.dart';
import 'package:kantin_online/ui/shared/ui_helper.dart';

class FoodCard extends StatefulWidget {

  String? name;
  String? value;
  String? image;

  FoodCard({Key? key,
    required this.name,
    required this.value,
    required this.image,
}) : super(key: key);

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
      height: 125,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
          color: colorGrey2,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40), topLeft: Radius.circular(40))
      ),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: Text(
                    '${widget.name}',
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 15),
                  child: Text(
                    '${widget.value}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    ),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Stack(
                  children: <Widget>[
                    Row(
                      children: List.generate(
                        5, (index) =>
                      const Icon(
                        Icons.star,
                        color: colorOrange,
                        size: 14,
                      ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: Container(
                          height: 15,
                          width: 50,
                          decoration: BoxDecoration(
                          border: Border.all(color: colorRed),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Material(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: const Text(
                              'Tambah',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: colorRed, fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            right: 10,
            child: Image.asset(
              '${widget.image}',
              width: 130,
              height: 120,
              filterQuality: FilterQuality.high,

            ),
          )
        ],
      ),
    );
  }
}
