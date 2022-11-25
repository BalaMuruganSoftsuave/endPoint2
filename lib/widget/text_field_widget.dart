import 'package:endpoint2/helper/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helper/app_color.dart';

class TextFieldBox extends StatelessWidget {
  TextEditingController? controller;
  TextInputType? inputType;
  Function(String)? onChange;
  String? Function(String?)? validate;
  String labelText;
  Widget? suffix;
  Function()? onTap;
  List<TextInputFormatter>? inputFormat;
  FloatingLabelBehavior? floating;
  FocusNode? focusNode;

  TextFieldBox(
      {Key? key,
      this.suffix,
      this.inputFormat,
      this.labelText = "",
      this.controller,
      this.onChange,
      this.inputType,
      this.validate,
      this.onTap,
      this.floating = FloatingLabelBehavior.auto,
      this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    isDarkMode.value =
        (MediaQuery.of(context).platformBrightness == Brightness.dark);
    return ValueListenableBuilder(
        valueListenable: isDarkMode,
        builder: (context, bool isDark, child) {
          return Container(
            decoration: BoxDecoration(
                color: isDark
                    ? AppColor.textFieldBackgroundDark
                    : AppColor.textFieldBackground,
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              onTap: onTap,
              inputFormatters: inputFormat,
              controller: controller,
              focusNode: focusNode,
              onChanged: onChange,
              keyboardType: inputType,
              validator: validate,
              style: AppStyle.notaSubText(
                color: isDark ? AppColor.appWhite : AppColor.appBlack,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  suffixIcon: suffix,
                  contentPadding:
                      const EdgeInsets.only(top: 10, bottom: 10, left: 12),
                  border: InputBorder.none,
                  labelText: labelText,
                  labelStyle: AppStyle.notaSubText(color: AppColor.textGrey2),
                  floatingLabelBehavior: floating),
            ),
          );
        });
  }
/*red: 0.912, green: 0.934, blue: 0.942, alpha: 1*/
}
