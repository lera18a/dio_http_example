import 'package:dio_http_example/my_app.dart';
import 'package:dio_http_example/ui/global_ui_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('holidays searching test', (tester) async {
      // Load app widget.
      await GlobalUIPageActions.awaitGlobalUIPage(tester);
      await GlobalUIPageActions.selectCountry(tester, find, '🇦🇴 Angola');
      await GlobalUIPageActions.selectYear(tester, find, '2000');
      await GlobalUIPageActions.tabSearchButtom(tester, find);

      final newYear = find.text('New Year');
      expect(newYear, findsOneWidget);
    });
    testWidgets(
      'holidays searching test(step tabSearchButtom -> step selectYear -> step selectCountry)',
      (tester) async {
        // Load app widget.
        await GlobalUIPageActions.awaitGlobalUIPage(tester);
        await GlobalUIPageActions.tabSearchButtom(tester, find);
        await GlobalUIPageActions.selectYear(tester, find, '2000');
        await GlobalUIPageActions.selectCountry(tester, find, '🇦🇴 Angola');

        final newYear = find.text('New Year');
        expect(newYear, findsNothing);
      },
    );
  });
}

class GlobalUIPageActions {
  static Finder _findSearchButtom(CommonFinders find) {
    return find.byKey(const ValueKey(GlobalUIPage.searchButtomKey));
  }

  static Finder _findSelectCountryDropDown(CommonFinders find) {
    return find.byKey(const ValueKey(GlobalUIPage.countryDropDownKey));
  }

  static Finder _findSelectYearDropDown(CommonFinders find) {
    return find.byKey(const ValueKey(GlobalUIPage.yearDropDownKey));
  }

  static awaitGlobalUIPage(WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(Duration(seconds: 3));
  }

  static tabSearchButtom(WidgetTester tester, CommonFinders find) async {
    final searchButtom = _findSearchButtom(find);
    await tester.tap(searchButtom, warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 3));
  }

  static selectCountry(
    WidgetTester tester,
    CommonFinders find,
    String country,
  ) async {
    final selectCountry = _findSelectCountryDropDown(find);
    await tester.tap(selectCountry, warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 3));
    final selectedCountry = find.text(country);
    await tester.tap(selectedCountry, warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 3));
  }

  static selectYear(
    WidgetTester tester,
    CommonFinders find,
    String year,
  ) async {
    final selectYear = _findSelectYearDropDown(find);
    await tester.tap(selectYear, warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 3));
    final selectedYear = find.text(year);
    await tester.tap(selectedYear, warnIfMissed: false);
    await tester.pumpAndSettle(Duration(seconds: 3));
  }
}
