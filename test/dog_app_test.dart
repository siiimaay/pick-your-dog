import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pick_your_dog/main.dart';

import 'mock_dio.dart';

void main() {
  MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    mockClient(mockDioClient);
  });

  testWidgets('Test fetch random image', (WidgetTester tester) async {
    //setUp()
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('card_key')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('dropdown_key')));
    await tester.pump();

    await tester.tap(find.byKey(const Key('submit_button_key')));
    await tester.pump();

    expect(find.byKey(const Key('image_key')), findsOneWidget);
  });
}
