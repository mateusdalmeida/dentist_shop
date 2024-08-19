import 'package:dentist_shop/constants/text_styles.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({
    super.key,
    this.message = "Não encontramos produtos correspondentes",
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Image(image: AssetImage('assets/not_found.png'), width: 300),
        const SizedBox(height: 32),
        const Text("Sem produtos para exibição",
            textAlign: TextAlign.center, style: AppTextStyles.title),
        Text(message, textAlign: TextAlign.center, style: AppTextStyles.info)
      ],
    );
  }
}
