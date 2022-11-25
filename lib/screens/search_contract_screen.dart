import 'package:endpoint2/BlocHelper/charter_cubit.dart';
import 'package:endpoint2/helper/appStyle.dart';
import 'package:endpoint2/helper/app_color.dart';
import 'package:endpoint2/helper/nav_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../widget/textFieldWidget.dart';

class SearchContractScreen extends StatelessWidget {
  const SearchContractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isDarkMode.value=(MediaQuery.of(context).platformBrightness==Brightness.dark);

    ValueNotifier<String> search=ValueNotifier("");
    return Scaffold(
      body: BlocListener<CharterCubit,CharterState>(
        listener: (BuildContext context, state) {
          if(state.charterReqState==CharterReqState.LOADING){

          }
        },
        child: ValueListenableBuilder(
            valueListenable: isDarkMode,
            builder: (context,bool isDark,child) {
              return  SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18.0,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Charterer",
                      style: AppStyle.notaTitle(
                        color: isDark?AppColor.appWhiteDark:AppColor.appBlack
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        bottom: 20,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextFieldBox(
                          onChange: (val){
                            context.read<CharterCubit>().getCharterList(val.toString());
                            search.value=val;
                          },
                          floating: FloatingLabelBehavior.never,
                          labelText: "Search",
                          suffix: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: SvgPicture.asset(
                              "assets/images/search.svg",
                            ),
                          ),
                        ),
                      ),
                    ),

                    ValueListenableBuilder(
                      valueListenable: search,
                      builder: (context,String searchString,child) {
                        if(searchString.isNotEmpty) {
                          return Flexible(
                          child: BlocBuilder<CharterCubit,CharterState>(
                            builder: (context,state) {
                              return Container(

                                decoration:
                                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: state.charterList==null||state.charterList?.data==null?Center(
                                    child: state.charterReqState!=CharterReqState.LOADING?Text("There is no data found",
                                      style: AppStyle.notaSubText(
                                          color:isDark?AppColor.appWhiteDark:AppColor.appBlack
                                      ),):CircularProgressIndicator(
                                      color: isDark?AppColor.appWhiteDark:AppColor.appBlue,
                                    ),
                                  ):Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.charterList?.data?.length,
                                        itemBuilder: (context, index) {
                                          return  Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0, horizontal: 16),
                                            child: Text(
                                              state.charterList?.data![index].chartererName.toString()??"",
                                              style: AppStyle.notaSubText(
                                                  color:isDark?AppColor.appWhiteDark:AppColor.appBlack
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              );
                            }
                          ),
                        );
                        }



                        return Container();
                      }
                    ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Can’t find your Charterer?  ',
                              style: AppStyle.notaSubText(
                                color: isDarkMode.value?AppColor.textGreyDark3:AppColor.textGrey2,
                              )),
                            InkWell(
                              onTap: (){
                                openScreen(addCharterScreen);
                              },
                              child: Text(
                                 'Add now',
                                style: AppStyle.notaSubText(
                                    color: AppColor.appBlue
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
