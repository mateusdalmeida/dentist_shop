import 'package:dentist_shop/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width >= 640;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Conta"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              width: isWideScreen ? 400 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const FlutterLogo(size: 150),
                  const SizedBox(height: 18),
                  ..._buildInfo(title: "Nome", info: "Nome Exemplo"),
                  ..._buildInfo(title: "Email", info: "nomeexemplo@mail.com"),
                  ..._buildInfo(title: "Nascimento", info: "01/01/2000")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildInfo({required String title, required String info}) {
    return [
      Text(
        title,
        style: AppTextStyles.info,
      ),
      Text(
        info,
        style: AppTextStyles.subinfo,
      ),
      const SizedBox(height: 18)
    ];
  }
}
