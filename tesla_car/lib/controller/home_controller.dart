import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  bool isLeftDoorLock = true;
  bool isRightDoorLock = true;
  bool isBonnetLock = true;
  bool isTrunkLock = true;

  void updateLeftDoorLock() {
    isLeftDoorLock = !isLeftDoorLock;
    notifyListeners();
  }

  void updateRightDoorLock() {
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
  }

  void updateBonnetDoorLock() {
    isBonnetLock = !isBonnetLock;
    notifyListeners();
  }

  void updateTrunkDoorLock() {
    isTrunkLock = !isTrunkLock;
    notifyListeners();
  }
}
