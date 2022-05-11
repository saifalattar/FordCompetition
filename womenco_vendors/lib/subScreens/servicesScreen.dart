import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:womenco_vendors/cubit/bloc.dart';
import 'package:womenco_vendors/cubit/states.dart';
import 'package:womenco_vendors/shared/component/components.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896));

    return BlocProvider(
      create: (context) => WomenCoCubitVendors(),
      child: BlocConsumer<WomenCoCubitVendors, WomenCoStatesVendors>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ))),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Services",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Select services that you can provide .",
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 59.h,
                        ),
                        Center(
                          child: GroupButton(
                              options: GroupButtonOptions(
                                // Buttons Styling
                                borderRadius: BorderRadius.circular(12.0),
                                selectedTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                selectedColor: Colors.blue[300],
                                unselectedColor: Colors.grey[300],
                                unselectedTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                ),
                                buttonHeight: 50.h,
                                buttonWidth: 95.w,
                                textAlign: TextAlign.center,
                                alignment: Alignment.center,
                              ),
                              controller:
                                  GroupButtonController(selectedIndex: 0),
                              isRadio:
                                  true, //If we want one option only to be selected
                              buttons: ["Cleaning", "Nursing", "Cooking"],
                              onSelected: (val, i, selected) {
                                WomenCoCubitVendors.GET(context)
                                    .selectedService = val.toString();
                              }),
                        ),
                      ],
                    ),
                    WomenCoButton(context,
                        title: "Continue",
                        onPressed: () {},
                        color: Colors.blue[300])
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
