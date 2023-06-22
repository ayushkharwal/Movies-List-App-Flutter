import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  TextEditingController textEditingController;
  String? Function(String? value)? validator;
  TextInputType? textInputType;
  String? labelText;

  CustomTextField({
    super.key,
    required this.textEditingController,
    this.validator,
    this.textInputType,
    this.labelText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(88, 98, 118, 0.898),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: widget.textEditingController,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: Color.fromRGBO(88, 98, 118, 0.898),
            ),
          ),
          fillColor: const Color.fromRGBO(64, 75, 96, .9),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Color.fromRGBO(191, 202, 220, 0.89),
          ),
        ),
        keyboardType: widget.textInputType,
        validator: widget.validator,
      ),
    );
  }
}
