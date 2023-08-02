import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.underline,
      required this.text,
      this.maxlines})
      : super(key: key);
  final TextEditingController controller;
  final bool underline;
  final String text;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        maxLines: maxlines ?? 1,
        controller: controller,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onSubmitted: (value) {
          controller.text = value;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: underline
              ? const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 36, 82, 233)),
                )
              : const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 15, 15, 16)),
                ),
          focusedBorder: underline
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.cyan))
              : const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 15, 15, 16)),
                ),
        ),
      ),
    );
  }
}
