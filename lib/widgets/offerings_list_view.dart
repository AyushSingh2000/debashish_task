import 'package:flutter/material.dart';

class Offerings extends StatefulWidget {
  const Offerings({Key? key}) : super(key: key);

  @override
  State<Offerings> createState() => _OfferingsState();
}

class _OfferingsState extends State<Offerings> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(40, (index) => 'Item $index');
    return Container(
      height: 600,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Container(
              color: Colors.grey,
              height: 30,
              width: 200,
              child: Text(items[index]),
              // Add more widgets here based on your item structure
            ),
          );
        },
      ),
    );
  }
}
