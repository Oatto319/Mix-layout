import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart';  // แก้ชื่อ package ให้ตรงกับของคุณ

void main() {
  testWidgets('App shows main title and car list', (WidgetTester tester) async {
    // Build the MainApp widget and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify the app shows the main title.
    expect(find.text('JDM Classic Cars'), findsOneWidget);

    // Verify at least one car name is displayed.
    expect(find.text('GT‑R R35'), findsOneWidget);

    // Verify that the ListView Button is present.
    expect(find.text('ListView Button'), findsOneWidget);
  });
}
