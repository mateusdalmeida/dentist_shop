import 'package:dentist_shop/constants/colors.dart';
import 'package:dentist_shop/constants/text_styles.dart';
import 'package:dentist_shop/utils.dart';
import 'package:flutter/material.dart';

class BuildWidgets {
  static Widget discountWidget(double? discount) {
    if (discount == null) return const SizedBox();

    final String formattedValue = discount % 1 == 0
        ? discount.toStringAsFixed(0)
        : discount.toStringAsFixed(1).replaceFirst('.', ',');

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        "$formattedValue% OFF",
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  static Widget installmentWidget(int value) {
    final int installmentValue = (value / 12).floor();

    return Text(
      "Em até 12x de ${Utils.getMoney(installmentValue)}",
      style: AppTextStyles.info,
    );
  }
}
