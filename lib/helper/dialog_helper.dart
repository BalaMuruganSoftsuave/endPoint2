

import 'package:endpoint2/helper/appStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_color.dart';

customToast(BuildContext context, {String? status, String? message}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: status == "Success"
                ? AppColor.checkGreen
                : status == "Cancel"
                ? AppColor.red1
                : status == "Error"
                ? AppColor.red1
                : AppColor.appBlue,

// title: new Text("Alert!!"),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          status == "Success"
                              ? "assets/images/toast_success.svg"
                              : status == "Cancel"
                              ? "assets/images/toast_error.svg"

                              : "assets/images/toast_error.svg"     ,

                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Text(
                            message.toString(),
                            style: AppStyle.notaSubText(
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColor.appWhite,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}