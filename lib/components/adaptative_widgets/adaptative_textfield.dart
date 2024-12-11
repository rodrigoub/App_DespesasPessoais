import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextfield extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  final InputDecoration? decoration;

  AdaptativeTextfield({
    this.label,
    this.controller,
    this.onSubmitted,
    this.keyboardType = TextInputType.text,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: keyboardType,
              placeholder: label,
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            decoration: InputDecoration(labelText: label),
          );
  }
}
