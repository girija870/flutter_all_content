import 'package:flut_all_content/counter/counter.dart';
import 'package:flut_all_content/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-test test', () {
    testWidgets('tap on floating action button, verify counter',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle(); //rebuild continuous untill button preccced

      //verify the punter start at 0
      expect(Counter().value, 0);

      //find the floating action button to tap on
      final Finder fab = find.byTooltip('Increment');

      //evaluate the tap on floating action button
      await tester.tap(fab);

      //trigger a frame
      await tester.pumpAndSettle();

      //verify the counter increment by 1

      expect(find.text('1'), findsOneWidget);
    });
  });
}
