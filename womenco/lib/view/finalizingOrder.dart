import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/shared/component/components.dart';
import 'package:womenco/view/bookNow/cleaningBook.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';

class FinishOrder extends StatefulWidget {
  const FinishOrder({Key? key}) : super(key: key);

  @override
  State<FinishOrder> createState() => _FinishOrderState();
}

class _FinishOrderState extends State<FinishOrder> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
          builder: (context, states) {
            return Scaffold(
                appBar: customizedAppBar(context, () {
                  Navigator.pop(context);
                }),
                body: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ORDER ID - ${WomenCoCubit.GET(context).currentOrder.orderID}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          "Placed on - ${WomenCoCubit.GET(context).currentOrder.day} ${WomenCoCubit.GET(context).getMonthFromNum(WomenCoCubit.GET(context).currentOrder.month!.toInt())} ${WomenCoCubit.GET(context).currentOrder.year}",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Row(
                          children: [
                            Icon(Icons.pin_drop),
                            Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text(
                            "${WomenCoCubit.GET(context).currentOrder.address}",
                            style: TextStyle(color: Colors.grey, fontSize: 18)),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Icon(Icons.phone_in_talk),
                            Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text(
                            "${WomenCoCubit.GET(context).currentOrder.vendorPhoneNumber}",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Icon(Icons.info_outline),
                            Text(
                              "Info",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 11.h),
                        Text(
                            "${WomenCoCubit.GET(context).currentOrder.whatIsOrderType()}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        Text(
                            "${appartmentTypesList[typeController.selectedIndex!.toInt()]} ${sizeController}m , ${appartmentRoomsList[roomsController.selectedIndex!.toInt()]} rooms ",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        Text(
                            "Delivery in : ${WomenCoCubit.GET(context).getMonthFromNum(WomenCoCubit.GET(context).currentOrder.deliveryTime!.month)}  ${WomenCoCubit.GET(context).currentOrder.deliveryTime!.day}  ${WomenCoCubit.GET(context).currentOrder.deliveryTime!.hour}:${WomenCoCubit.GET(context).currentOrder.deliveryTime!.minute}",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 30.h),
                        Text(
                          "Worker",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 11.h),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  WomenCoCubit.GET(context)
                                      .currentOrder
                                      .vendorData!
                                      .imageURL),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "${WomenCoCubit.GET(context).currentOrder.vendorData!.name}",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          "Payment Method",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(height: 11.h),
                        Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.green,
                            ),
                            SizedBox(width: 10.w),
                            Text("Cash",
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))
                          ],
                        ),
                        SizedBox(height: 33.h),
                        Text(
                          "Summary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 11.h,
                        ),
                        Text(
                            "Total Fees\t ${WomenCoCubit.GET(context).currentOrder.price} EGP",
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        SizedBox(
                          height: 25.h,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                ),
                                Text("Cancel Order",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25))
                              ],
                            ))
                      ],
                    ),
                  ),
                ));
          },
          listener: (context, states) {}),
    );
  }
}
