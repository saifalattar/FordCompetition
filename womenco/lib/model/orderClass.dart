import 'package:flutter/material.dart';
import 'package:womenco/model/workerClass.dart';

class Order {
  String? orderID;
  String? vendorPhoneNumber;
  orderTypes? type;
  orderStatus? status;
  String? address;
  double? price;
  int? day;
  int? month;
  int? year;
  DateTime? deliveryDate;
  TimeOfDay? deliveryTime;

  Order(
      {required String orderID,
      required String vendorPhoneNumber,
      required orderTypes type,
      required orderStatus status,
      required String address,
      required int day,
      required int year,
      required int month,
      required TimeOfDay? deliveryTime,
      required DateTime deliveryDate,
      required double price}) {
    this.deliveryTime = deliveryTime;
    this.vendorPhoneNumber = vendorPhoneNumber;
    this.orderID = orderID;
    this.type = type;
    this.status = status;
    this.address = address;
    this.price = price;
    this.deliveryDate = deliveryDate;
    this.year = year;
    this.day = day;
    this.month = month;
  }

  Text whatIsStatus() {
    switch (this.status) {
      case orderStatus.Completed:
        return Text("Completed",
            style: TextStyle(
                fontSize: 14, fontFamily: "Avenir", color: Colors.green));
      case orderStatus.Pending:
        return Text("Pending",
            style: TextStyle(
                fontSize: 14, fontFamily: "Avenir", color: Colors.pink));
      default:
        return Text("unexpected error");
    }
  }

  String whatIsOrderType() {
    switch (this.type) {
      case orderTypes.Cleaning:
        return "Cleaning";
      case orderTypes.Cooking:
        return "Cooking";
      case orderTypes.Nursing:
        return "Nursing";
      default:
        return "unexpected error";
    }
  }

  Widget orderWidget() {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${this.year}/${this.month}/${this.day}",
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            Text(
              whatIsOrderType(),
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            whatIsStatus(),
          ],
        ),
        VerticalDivider(
          color: Colors.red[100],
          thickness: 2,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${this.address}",
              style: TextStyle(fontSize: 17, color: Colors.grey[600]),
            ),
            Text("${this.price!.toInt()} EGP",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold))
          ],
        )
      ],
    );
  }
}

enum orderTypes { Cleaning, Nursing, Cooking }
enum orderStatus { Completed, Pending }
