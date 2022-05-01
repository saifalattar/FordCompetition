import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(BoxConstraints(),
        context: context, designSize: Size(414, 896));
    return BlocProvider(
      create: (context) => WomenCoCubit(),
      child: BlocConsumer<WomenCoCubit, WomenCoStates>(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets\\boarding1.png",
                              height: 532.h, fit: BoxFit.cover, width: 414.w),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Welcome To WomenCo",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            """Looking to hire someone to do house work \nCleaning, Cooking and Caring? We can help!""",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets\\boarding2.png",
                            height: 532.h,
                            width: 414.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Find the best choose",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              """
            Womanco allow you to choose the best workers To clean your housemate your food or take care Of  someone health. 
            """,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets\\boarding3.png",
                            height: 532.h,
                            width: 414.w,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "Why Choose WomenCo ?",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Text(
                              """WomenCo provides you with security and Healthy Insurance for all workers and ease of ordering. """,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                              maxLines: 3,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                DotsIndicator(
                  decorator: DotsDecorator(
                    size: const Size.square(9.0),
                    color: Colors.grey.shade300,
                    activeSize: const Size(35.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  dotsCount: 3,
                  position: dotPosition,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 364.w,
                  height: 46.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          enableFeedback: true,
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink[200]))),
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
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                )
              ],
            ));
          },
          listener: (context, states) {}),
    );
  }
}

double dotPosition = 0;
