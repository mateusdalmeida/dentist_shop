import 'package:dentist_shop/widgets/build_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dentist_shop/constants/text_styles.dart';
import 'package:dentist_shop/utils.dart';

void main() {
  testWidgets('Exibição de desconto inteiro', (WidgetTester tester) async {
    // Testa quando o desconto é um número inteiro
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BuildWidgets.discountWidget(25.0),
        ),
      ),
    );

    expect(find.text('25% OFF'), findsOneWidget);
  });

  testWidgets('Exibição de desconto decimal', (WidgetTester tester) async {
    // Testa quando o desconto é um número decimal
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BuildWidgets.discountWidget(12.5),
        ),
      ),
    );

    expect(find.text('12,5% OFF'), findsOneWidget);
  });

  testWidgets('Sem widget se não tem desconto', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BuildWidgets.discountWidget(null),
        ),
      ),
    );

    expect(find.byType(SizedBox), findsOneWidget);
  });

  testWidgets('Teste de parcelamento', (WidgetTester tester) async {
    // Testa com um valor inteiro
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BuildWidgets.installmentWidget(2400),
        ),
      ),
    );

    final String installmentText = Utils.getMoney(200); // 2400 / 12 = 200
    expect(find.text('Em até 12x de $installmentText'), findsOneWidget);

    final Text textWidget = tester.widget(find.byType(Text));
    expect(textWidget.style, equals(AppTextStyles.info));
  });
}
