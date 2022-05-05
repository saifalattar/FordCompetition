// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:womenco/shared/component/components.dart';
import 'package:womenco/view/navigation/home/home_screen.dart';
import 'package:womenco/view/style/colors.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';

class CleaningBook extends StatefulWidget {
  @override
  State<CleaningBook> createState() => _CleaningBookState();
}

class _CleaningBookState extends State<CleaningBook> {
  ////    Variables    ////

  // Appartment Type Variables
  final typeController = GroupButtonController(
    selectedIndex: 0,
  );
  List appartmentTypesList = ["Apartment", "House", "Villa"];
  var selectedAppartType; //check

  // Appartment Size Variables
  var sizeController = 120;

  // Appartment Rooms Variables
  final roomsController = GroupButtonController(
    selectedIndex: 0,
  );
  List appartmentRoomsList = ["1", "2", "3", "4+"];
  var selectedAppartRooms; //check

  // Location Details Variables
  var governorateController;
  List<String> governorateList = ["Giza", "Cairo"];
  var cityController;
  List<String> cityList = [
    "Maadi",
    "Nasr City",
    "6th of October",
    "5th Settelment"
  ];
  var streetController;

  // Date Variables
  var dateController;

  // Time Variables
  TimeOfDay timeOfDay = const TimeOfDay(hour: 8, minute: 30);
  var timeController = TextEditingController();

  var verificationCode = "123456"; //remove (just for test)

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));

    return BlocConsumer<WomenCoCubit, WomenCoStates>(
      listener: (context, states) {},
      builder: (context, states) {
        WomenCoCubit cubit = WomenCoCubit.GET(context);

        return Scaffold(
          appBar: customizedAppBar(context),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                //// Scroll View
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        /// Screen Title
                        Center(
                            child: Text(
                          "Book A Worker",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        )),

                        SizedBox(height: 58.h),

                        /// Select Appartment Type
                        Text(
                          "Type",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        Center(
                          child: GroupButton(
                              options: GroupButtonOptions(
                                // Buttons Styling
                                borderRadius: BorderRadius.circular(12.0),
                                selectedTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                selectedColor: cleaningColor3,
                                unselectedColor: Colors.grey[300],
                                unselectedTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                ),
                                buttonHeight: 50.h,
                                buttonWidth: 109.w,
                                textAlign: TextAlign.center,
                                alignment: Alignment.center,
                              ),
                              controller: typeController,
                              isRadio:
                                  true, //If we want one option only to be selected
                              buttons: appartmentTypesList,
                              onSelected: (val, i, selected) {
                                debugPrint(
                                    'Button: $val index: $i selected: $selected');
                                selectedAppartType = val;
                              }),
                        ),

                        customizedDivider(),

                        /// Select Appartment Size
                        Text(
                          "Size",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        Center(
                          child: Text(
                            "${sizeController} m",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Slider.adaptive(
                          value: sizeController.toDouble(),
                          min: 80,
                          max: 500,
                          activeColor: cleaningColor3,
                          onChanged: (double value) {
                            setState(() {
                              sizeController = value.round();
                              print(sizeController);
                            });
                          },
                        ),

                        customizedDivider(),

                        /// Select Appartment Rooms
                        Text(
                          "Rooms",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        Center(
                          child: GroupButton(
                              options: GroupButtonOptions(
                                // Buttons Styling
                                borderRadius: BorderRadius.circular(12.0),
                                selectedTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                selectedColor: cleaningColor3,
                                unselectedColor: Colors.grey[300],
                                unselectedTextStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey[500],
                                ),
                                spacing: 25.w,
                                buttonHeight: 50.h,
                                buttonWidth: 60.w,
                                textAlign: TextAlign.center,
                                alignment: Alignment.center,
                              ),
                              controller: roomsController,
                              isRadio: true,
                              buttons: appartmentRoomsList,
                              onSelected: (val, i, selected) {
                                debugPrint(
                                    'Button: $val index: $i selected: $selected');
                                selectedAppartRooms = val;
                              }),
                        ),

                        customizedDivider(),

                        /// Location Details
                        Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        // DropDowns
                        Row(
                          children: [
                            // Governorate DropDown
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey[200],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: DropdownButton(
                                    alignment: Alignment.center,
                                    value: governorateController,
                                    hint: Text(
                                      "Governorate",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 17.0),
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: governorateList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        governorateController = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 20.w),

                            // City DropDown
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey[200],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: DropdownButton(
                                    alignment: Alignment.center,
                                    value: cityController,
                                    hint: Text(
                                      "City",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 17.0),
                                    ),
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: cityList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        cityController = newValue!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 20.h),

                        // Street
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey[200],
                          ),
                          child: TextFormField(
                            controller: streetController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: Colors.white24),
                              ),
                              hintText: "Street",
                              hintStyle:
                                  TextStyle(color: Colors.grey, fontSize: 17.0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(color: cleaningColor3),
                              ),
                            ),
                          ),
                        ),

                        customizedDivider(),

                        /// Select Date
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        SfDateRangePicker(
                          controller: dateController,
                          showTodayButton: true,
                          view: DateRangePickerView.month,
                          minDate: DateTime.now(),
                          monthViewSettings: DateRangePickerMonthViewSettings(
                            firstDayOfWeek: 1,
                            showTrailingAndLeadingDates: true,
                          ),
                          onSelectionChanged: (date) {
                            dateController = date.value;
                            print("My cont: ${dateController.toString()}");
                          },
                        ),

                        customizedDivider(),

                        /// Select Time
                        Text(
                          "Time",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        Center(
                          child: Column(children: [
                            Text(
                              timeOfDay.format(context).toString(),
                              style: const TextStyle(
                                fontSize: 25,
                                color: Colors.grey,
                              ),
                            ),
                            MaterialButton(
                              onPressed: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  setState(() {
                                    timeOfDay = value!;
                                  });
                                });
                              },
                              color: cleaningColor3,
                              child: Text(
                                'Pick Time',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ]),
                        ),

                        customizedDivider(),

                        /// Select Worker
                        Text(
                          "Worker",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25.h),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Choose One",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: cleaningColor3,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))),
                            )
                          ],
                        ),

                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                ),

                //// "NEXT" Button
                Container(
                  width: 364.w,
                  height: 46.h,
                  child: ElevatedButton(
                      onPressed: (typeController == null &&
                              roomsController == null &&
                              governorateController == null &&
                              cityController == null &&
                              streetController == null &&
                              dateController == null &&
                              timeController == null)
                          ? null
                          : () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen())); //PaymentScreen()
                            },
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style: ButtonStyle(
                          enableFeedback: true,
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor: MaterialStateProperty.all(
                              verificationCode.length < 6
                                  ? Colors.grey[300]
                                  : cleaningColor3))),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



// onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Worker(
//                               imageURL: "",
//                               name: "AnyBody",
//                               lastOrderDate_Day: 3,
//                               lastOrderDate_Month: 5,
//                               lastOrderDate_Year: 2022,
//                               profession: "Cleaning",
//                               numOfOrders: 54,
//                               rate: 2.75,
//                               availability: false)));
//                 },