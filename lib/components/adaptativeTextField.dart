import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keybordType;
  final Function(String) onSubmit;

  AdaptativeTextField({
    this.label,
    this.controller,
    this.keybordType = TextInputType.text,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: CupertinoTextField(
              controller: controller,
              keyboardType: keybordType,
              onSubmitted: onSubmit,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            keyboardType: keybordType,
            onSubmitted: onSubmit,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
