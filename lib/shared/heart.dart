import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  /*some basic purpose  of mixin ......
  *
  * void main() {
  Admin().canPublishStatus();
}
class User{
  void postStatus(){
      print("Post status");
  }
}

class Moderator extends User{
  void deleteStatus(){
    print("Delete status");
  }
}

class Advertiser extends User with publishStatus{}

class Admin extends Moderator with publishStatus{}

mixin publishStatus {
   void canPublishStatus(){
      print("Publish status");
  }
} */

  Animation<Color>? _colorAnimation;
  Animation<double>? _sizeAnimation;
  Animation? _curve;
  bool isFav = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync:
            this); // vsync does sync sync the animation of this context with this

    _curve = CurvedAnimation(
        parent: _animationController!, curve: Curves.slowMiddle);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_curve as Animation<double>) as Animation<Color>?;

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 50, end: 30), weight: 50)
    ]).animate(_curve as Animation<double>); //animate(_animationController!)

    _animationController?.addListener(() {
      if (kDebugMode) {
        print(_animationController?.value);
        print(_colorAnimation?.value);
      }
    });

    _animationController?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      } else if (status == AnimationStatus.dismissed) {
        isFav = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (BuildContext context, Widget? child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation?.value,
            size: _sizeAnimation?.value,
          ),
          onPressed: () {
            log("boolalue::$isFav");
            isFav
                ? _animationController?.reverse()
                : _animationController
                    ?.forward(); //start the animationController forward
          },
        );
      },
    );
  }
}
