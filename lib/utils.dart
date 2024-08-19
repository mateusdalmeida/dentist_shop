class Utils {
  static String getMoney(int value) {
    double money = value / 100;

    return "R\$ ${money.toStringAsFixed(2).replaceFirst('.', ',')}";
  }

  static String getRelativeDate(String dateString) {
    final DateTime date = DateTime.parse(dateString);
    final DateTime now = DateTime.now();
    final int difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Hoje';
    } else if (difference == 1) {
      return 'Ontem';
    } else {
      return '$difference dias atrás';
    }
  }

  static int calculateSaleValue(int value, double? discount) {
    if (discount == null) return value;

    double discountAmount = value * (discount / 100);
    return (value - discountAmount).floor();
  }
}
