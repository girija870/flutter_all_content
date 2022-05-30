import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({Key? key, required this.press, required this.isLock})
      : super(key: key);

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutBack, //jumping effect
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        duration: defaultDuration,
        child: isLock
            ? SvgPicture.asset(
                'assets/icons/door_lock.svg',
                key: const ValueKey('lock'),
              ) //flutter this they are same widget so do not animate so we need to add value key to animate
            : SvgPicture.asset('assets/icons/door_unlock.svg',
                key: const ValueKey('unlock')),
      ),
    );
  }
}
