import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  final int initialValue;
  final Function(int) onChanged;

  const QuantityWidget({Key? key, required this.initialValue, required this.onChanged}) : super(key: key);

  @override
  _QuantityWidgetState createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_quantity > 1) {
              setState(() {
                _quantity--;
                widget.onChanged(_quantity);
              });
            }
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black),
            ),
            child: Center(
              child: Icon(Icons.remove),
            ),
          ),
        ),
        SizedBox(width: 10),
        Text(
          '$_quantity',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              _quantity++;
              widget.onChanged(_quantity);
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: Center(
              child: Icon(Icons.add, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}