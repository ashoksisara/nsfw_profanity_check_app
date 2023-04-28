import 'package:flutter/material.dart';

import '../constant/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final int? maxLines;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? suffixIcon;

  const CustomTextField(
      {Key? key,
      required this.textEditingController,
      this.maxLines,
      this.onChanged,
      this.hintText,
      this.suffixIcon,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 6,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error, width: 2),
          ),
          counterStyle: const TextStyle(fontSize: 0),
          hintText: hintText,
          hintStyle: const TextStyle(
              color: AppColor.appDarkGrey, fontWeight: FontWeight.normal),
          suffixIcon: suffixIcon),
      style: const TextStyle(color: AppColor.appBlack),
    );
  }
}
