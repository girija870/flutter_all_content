import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

main() {
  group('reverse string test', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver!.close();
      }
    });

    var textButton = find.text('GoToToReverseStringPage');
    var textFiled = find.byType('TextFiled');
    var button = find.text("Reverse");

    var reverse = find.text('olleH');

    test('reverse the string', () async {
      await driver!.tap(textButton);
      await driver!.tap(textFiled);
      // await Future.delayed(const Duration(seconds: 2));
      await driver!.enterText('Hello');
      // await Future.delayed(const Duration(seconds: 2));

      await driver!.waitForAbsent(reverse);
      await driver!.tap(button);
      // await Future.delayed(const Duration(seconds: 2));

      await driver!.waitFor(reverse);
      await driver!.waitUntilNoTransientCallbacks();
      assert(reverse != null);
    });
  });
}
