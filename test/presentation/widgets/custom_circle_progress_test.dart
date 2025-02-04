import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies_series_app/presentation/widgets/custom_circular_progress.dart';

void main() {
  group('Testing circular progress', () {
    testWidgets('Testing circular progress', (tester) async {
      const childWidget = CustomCircularProgress();
      await tester.pumpWidget(Container(child: childWidget));
      expect(find.byWidget(childWidget), findsOneWidget);
    });
  });
}
