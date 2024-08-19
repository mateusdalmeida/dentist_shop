import 'package:dentist_shop/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Utils', () {
    test('Conversão de centavos para reais', () {
      expect(Utils.getMoney(123456), 'R\$ 1234,56');
      expect(Utils.getMoney(100), 'R\$ 1,00');
      expect(Utils.getMoney(0), 'R\$ 0,00');
      expect(Utils.getMoney(-12345), 'R\$ -123,45');
    });

    test('Data relativa', () {
      final now = DateTime.now();
      final yesterday = now.subtract(const Duration(days: 1));
      final twoDaysAgo = now.subtract(const Duration(days: 2));

      expect(Utils.getRelativeDate(now.toIso8601String()), 'Hoje');
      expect(Utils.getRelativeDate(yesterday.toIso8601String()), 'Ontem');
      expect(
          Utils.getRelativeDate(twoDaysAgo.toIso8601String()), '2 dias atrás');
    });

    test('Valor de venda', () {
      expect(Utils.calculateSaleValue(1000, 10.0), 900);
      expect(Utils.calculateSaleValue(1000, 0.0), 1000);
      expect(Utils.calculateSaleValue(1000, null), 1000);
      expect(Utils.calculateSaleValue(1000, 25.0), 750);
      expect(Utils.calculateSaleValue(1234, 12.5), 1079);
    });
  });
}
