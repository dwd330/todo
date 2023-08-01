import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      this.icon,
      required this.text,
      this.maxlines})
      : super(key: key);
  final TextEditingController controller;
  final IconData? icon;
  final String text;
  final int? maxlines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
          prefixIcon: Icon(
            icon,
          ),
          suffixIcon: (icon != null)
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.replay_rounded, color: Colors.grey),
                )
              : const SizedBox(
                  width: 0,
                ),
          hintText: text,
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
