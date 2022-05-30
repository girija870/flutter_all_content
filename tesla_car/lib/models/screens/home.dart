import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tesla_car/controller/home_controller.dart';
import 'package:tesla_car/models/screens/component/tesla_bottom_navigation_bar.dart';

import 'component/door_lock.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        //its should be listable
        animation: _controller,
        builder: (context, snapshot) {
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(onTap: (int value) {  }, selectedTab: 0,),
            body: SafeArea(
              child: LayoutBuilder(builder: (context, constraint) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: constraint.maxHeight * 0.1),
                      child: SvgPicture.asset('assets/icons/Car.svg',
                          width: double.infinity),
                    ),
                    Positioned(
                        left: constraint.maxWidth * 0.05,
                        //need to animate  the lock when we click
                        child: DoorLock(
                            isLock: _controller.isLeftDoorLock,
                            press: _controller.updateLeftDoorLock)),
                    Positioned(
                        right: constraint.maxWidth * 0.05,
                        //need to animate  the lock when we click
                        child: DoorLock(
                            isLock: _controller.isRightDoorLock,
                            press: _controller.updateRightDoorLock)),
                    Positioned(
                        top: constraint.maxHeight * 0.13,
                        //need to animate  the lock when we click
                        child: DoorLock(
                            isLock: _controller.isBonnetLock,
                            press: _controller.updateBonnetDoorLock)),
                    Positioned(
                        bottom: constraint.maxHeight * 0.17,
                        //need to animate  the lock when we click
                        child: DoorLock(
                            isLock: _controller.isTrunkLock,
                            press: _controller.updateTrunkDoorLock)),
                  ],
                );
              }),
            ),
          );
        });
  }
}




