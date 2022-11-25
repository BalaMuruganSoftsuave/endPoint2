import 'package:country_picker/country_picker.dart';
import 'package:endpoint2/helper/dialog_helper.dart';
import 'package:endpoint2/modal/add_charter_modal.dart';
import 'package:endpoint2/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../bloc/charter_cubit.dart';
import '../helper/app_color.dart';
import '../helper/app_style.dart';
import '../helper/nav_helper.dart';
import '../helper/utils.dart';

class AddCharterScreen extends StatelessWidget {
  AddCharterScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<Country> country = ValueNotifier(Country(
    phoneCode: '',
    countryCode: '',
    e164Sc: -1,
    geographic: false,
    level: -1,
    name: 'Country of residence',
    example: '',
    displayName: 'World Wide (WW)',
    displayNameNoCountryCode: 'World Wide',
    e164Key: '',
  ));
  ValueNotifier<Country> countryCode = ValueNotifier(Country(
    phoneCode: '',
    countryCode: '',
    e164Sc: -1,
    geographic: false,
    level: -1,
    name: 'Country of residence',
    example: '',
    displayName: 'World Wide (WW)',
    displayNameNoCountryCode: 'World Wide',
    e164Key: '',
  ));
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController website = TextEditingController(text: "https://");
  ValueNotifier<bool> circleProgress = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    isDarkMode.value =
        (MediaQuery.of(context).platformBrightness == Brightness.dark);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Builder(builder: (context) {
            return ValueListenableBuilder(
                valueListenable: isDarkMode,
                builder: (context, bool isDark, child) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 30,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    back(null);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 8.0, top: 8, bottom: 8),
                                    child: SvgPicture.asset(
                                      "assets/images/back.svg",
                                      color: isDarkMode.value
                                          ? AppColor.appWhiteDark
                                          : AppColor.appBlack,
                                    ),
                                  )),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "Add charterer",
                                style: AppStyle.heeboTitle(
                                  fontSize: 34,
                                  color: isDarkMode.value
                                      ? AppColor.appWhiteDark
                                      : AppColor.appBlack,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 5.0, top: 15),
                                child: TextFieldBox(
                                  controller: name,
                                  labelText: "Full name",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFieldBox(
                                  controller: email,
                                  labelText: "Email",
                                  validate: (val) {
                                    if (val!.isEmpty) {
                                      return "Please Enter Email";
                                    } else if (isEmailValid(val)) {
                                      return "Please Enter Valid Email";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: InkWell(
                                  onTap: () {
                                    countryPicker(context,
                                        phone: false, isDark: isDark);
                                  },
                                  child: ValueListenableBuilder(
                                      valueListenable: country,
                                      builder: (context, Country name, child) {
                                        return Container(
                                          padding: const EdgeInsets.only(
                                              top: 17,
                                              bottom: 17,
                                              left: 12,
                                              right: 12),
                                          decoration: BoxDecoration(
                                              color: isDark
                                                  ? AppColor
                                                      .textFieldBackgroundDark
                                                  : AppColor
                                                      .textFieldBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                name.name.isNotEmpty
                                                    ? name.name
                                                    : "Country of residence",
                                                style: AppStyle.notaSubText(
                                                    color: AppColor.textGrey2),
                                              ),
                                              SvgPicture.asset(
                                                  "assets/images/downArrow.svg")
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          countryPicker(context,
                                              phone: true, isDark: isDark);
                                        },
                                        child: ValueListenableBuilder(
                                            valueListenable: countryCode,
                                            builder:
                                                (context, Country code, child) {
                                              return Container(
                                                padding: const EdgeInsets.only(
                                                    top: 17,
                                                    bottom: 17,
                                                    left: 12,
                                                    right: 12),
                                                decoration: BoxDecoration(
                                                    color: isDark
                                                        ? AppColor
                                                            .textFieldBackgroundDark
                                                        : AppColor
                                                            .textFieldBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Row(
                                                  children: [
                                                    code.phoneCode.isNotEmpty
                                                        ? Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                            ),
                                                            child: Text(
                                                                code.flagEmoji))
                                                        : SvgPicture.asset(
                                                            'assets/images/united kingdom.svg'),
                                                    Text(
                                                      code.phoneCode.isNotEmpty
                                                          ? " + ${code.phoneCode}"
                                                          : " +44",
                                                      style: TextStyle(
                                                          color: AppColor
                                                              .textGrey2),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextFieldBox(
                                        controller: mobileNumber,
                                        labelText: "Mobile number",
                                        inputType: TextInputType.phone,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFieldBox(
                                  controller: address,
                                  labelText: "Address",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFieldBox(
                                  controller: state,
                                  labelText: "State",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFieldBox(
                                  controller: city,
                                  labelText: "City",
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: TextFieldBox(
                                  controller: website,
                                  labelText: "Website",
                                  validate: (val) {
                                    if (val!.isEmpty) {
                                      return "Please Enter URL";
                                    } else if (isUrlValid(val)) {
                                      return "Please Enter Valid URL";
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 50,
                                ),
                                child: Row(
                                  children: [
                                    Text('Want to search again? ',
                                        style: AppStyle.notaSubText(
                                            color: AppColor.textGreyDark3)),
                                    InkWell(
                                      onTap: () {
                                        openScreen(initialRoute);
                                      },
                                      child: Text(
                                        'Click here',
                                        style: AppStyle.notaSubText(
                                            color: AppColor.appBlue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  await _formKey.currentState?.validate();
                                  onTapValidation(context);

                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.appBlue,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0.0, 3.0),
                                          color: AppColor.appBlue,
                                          blurRadius: 7.0,
                                        ),
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Continue",
                                        style: AppStyle.notaTitle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
          ValueListenableBuilder(
              valueListenable: circleProgress,
              builder: (context, bool circle, child) {
                return Visibility(
                    visible: circle, child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }

  countryPicker(BuildContext context,
      {required bool phone, bool isDark = false}) {
    showCountryPicker(
        context: context,
        showPhoneCode: phone,
        searchAutofocus: true,
        countryListTheme: CountryListThemeData(
          flagSize: 25,
          backgroundColor: isDark ? AppColor.appBlack : Colors.white,
          textStyle: const TextStyle(fontSize: 16, color: Colors.blueGrey),
          bottomSheetHeight: 500,
          // Optional. Country list modal height
          //Optional. Sets the border radius for the bottomsheet.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          //Optional. Styles the search field.
          inputDecoration: InputDecoration(
            labelText: 'Search',
            hintText: 'Start typing to search',
            suffixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: const Color(0xFF8C98A8).withOpacity(0.2),
              ),
            ),
          ),
        ),
        onSelect: (Country country) {
          print('Select country: ${country.displayName}');
          if (!phone) {
            this.country.value = country;
          } else {
            countryCode.value = country;
          }
        });
  }
  onTapValidation(BuildContext context)async{
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        address.text.isNotEmpty &&
        website.text.isNotEmpty &&
        mobileNumber.text.isNotEmpty &&
        state.text.isNotEmpty &&
        city.text.isNotEmpty) {
      circleProgress.value = true;
      var res = await context
          .read<CharterCubit>()
          .addCharter(AddCharter(
          name: name.text,
          email: email.text,
          address1: address.text,
          address2: "",
          country:
          country.value.name.toString(),
          website: website.text,
          contactPerson: "ABZ",
          phoneNumber: mobileNumber.text,
          state: state.text,
          city: city.text));

      if (res is String) {
        circleProgress.value = false;
        customToast(context,
            status: "Error",
            message:
            "Entered Detailed is wrong, please try again ");
      } else {
        circleProgress.value = false;
        customToast(context,
            status: "Success",
            message: "Successfully Created");
      }
    }
  }
}
