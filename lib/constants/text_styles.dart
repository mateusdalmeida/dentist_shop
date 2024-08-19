import 'package:dentist_shop/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  /// fontsize 20 e semibold
  static const TextStyle title =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 20);

  /// fontsize 16 e medium
  static const TextStyle subtitle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 16);

  /// fonte padrão, cor primaria
  static const TextStyle info = TextStyle(color: AppColors.primaryColor);

  /// fontweight medium, cor cinza
  static TextStyle subinfo =
      TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.w500);
}
