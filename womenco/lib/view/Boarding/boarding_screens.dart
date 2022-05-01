import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:womenco/shared/component/components.dart';
import 'package:womenco/view/style/colors.dart';
import 'package:womenco/viewModel/cubit/bloc.dart';
import 'package:womenco/viewModel/cubit/states.dart';
import 'package:womenco/view/Auth/login.dart';
import 'package:womenco/view/Auth/signup.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({Key? key}) : super(key: key);

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  double dotPosition = 0;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return Scaffold(
              body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: PageView(
                  onPageChanged: (index) {
                    setState(() {
                      dotPosition = double.parse(index.toString());
                    });
                  },
                  controller: PageController(),
                  clipBehavior: Clip.none,
                  children: [
                    customizedPageViewItem(
                        image: "assets/boarding1.png",
                        headline: "Welcome To WomenCo",
                        description:
                            "Looking to hire someone to do house work. Cleaning, Cooking and Caring? We can help!"),
                    customizedPageViewItem(
                        image: "assets/boarding2.png",
                        headline: "Find the best choose",
                        description:
                            "Womanco allow you to choose the best workers To clean your housemate your food or take care of someone health."),
                    customizedPageViewItem(
                        image: "assets/boarding3.png",
                        headline: "Why Choose WomenCo ?",
                        description:
                            "WomenCo provides you with security and Healthy Insurance for all workers and ease of ordering.")
                  ],
                ),
              ),
              DotsIndicator(
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  color: Colors.grey.shade300,
                  activeSize: const Size(35.0, 9.0),
                  activeColor: fontColor1,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
                dotsCount: 3,
                position: dotPosition,
              ),
              SizedBox(
                height: 30.h,
              ),
              WomenCoButton(
                title: "CREATE ACCOUNT",
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                        fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn()));
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 18, color: fontColor1),
                      ))
                ],
              )
            ],
          ));
        },
      ),
    );
  }
}
