import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController textController;
  final Function(String)? onChanged;

  const SearchWidget({Key? key, required this.textController, this.onChanged}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 20),
        fillColor: const Color(0xffF4F1F9),
        hintText: "Search",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        hintStyle: const TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
