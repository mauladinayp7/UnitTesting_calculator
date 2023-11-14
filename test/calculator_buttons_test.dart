import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/calculator_buttons.dart';

void main() {
  testWidgets('CalculatorButton Widget Test', (WidgetTester tester) async {
    // Define a mock function for updateDisplayText
    String displayText = '';
    void updateDisplayText(String newText) {
      displayText = newText;
    }

    // Define a mock function for getDisplayText
    String getDisplayText() {
      return displayText;
    }

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CalculatorButton(
            size: Size(100, 100),
            heightFactor: 0.1,
            widthFactor: 0.2,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            text: '1',
            textSizeFactor: 0.04,
            onPressed: () {
              displayText = '1';
            },
          ),
        ),
      ),
    );

    // Verify that the button is rendered with the correct text
    expect(find.text('1'), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.byType(CalculatorButton));
    await tester.pump();

    // Verify that onPressed updates the displayText
    expect(displayText, '1');
  });

  testWidgets('CalculatorButton.digit Widget Test', (WidgetTester tester) async {
    // Define a mock function for updateDisplayText
    String displayText = '';
    void updateDisplayText(String newText) {
      displayText = newText;
    }

    // Define a mock function for getDisplayText
    String getDisplayText() {
      return displayText;
    }

    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CalculatorButton.digit(
            size: Size(100, 100),
            backgroundColor: Colors.black,
            textColor: Colors.white,
            digit: '2',
            textSizeFactor: 0.04,
            getDisplayText: getDisplayText,
            updateDisplayText: updateDisplayText,
          ),
        ),
      ),
    );

    // Verify that the button is rendered with the correct text
    expect(find.text('2'), findsOneWidget);

    // Tap the button and trigger a frame.
    await tester.tap(find.byType(CalculatorButton));
    await tester.pump();

    // Verify that onPressed updates the displayText
    expect(displayText, '2');
  });

  // Add more tests for other types of CalculatorButton if needed
}
