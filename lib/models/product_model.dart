import 'package:dentist_shop/utils.dart';

class ProductModel {
  final String id;
  final String title;
  final int value; // uso de notação de centavos para valores
  final String? image;
  final double? discount;
  final ProductStatusEnum status;
  final DateTime createdAt;
  final ProductCategoriesEnum category;

  String get money => Utils.getMoney(value);

  ProductModel({
    required this.id,
    required this.title,
    required this.value,
    required this.status,
    required this.createdAt,
    required this.category,
    this.image,
    this.discount,
  });
}

enum ProductStatusEnum { novo, usado }

enum ProductCategoriesEnum {
  anestesicos,
  biosseguranca,
  descartaveis,
  estetica,
  ortodontia,
  endodontia,
  perifericos,
  moldagem,
  protese,
  cimentos,
  instrumentos,
  cirurgia,
  radiologia
}

extension ProductCategoriesExtension on ProductCategoriesEnum {
  String get title {
    switch (this) {
      case ProductCategoriesEnum.anestesicos:
        return 'Anestésicos';
      case ProductCategoriesEnum.biosseguranca:
        return 'Biossegurança';
      case ProductCategoriesEnum.descartaveis:
        return 'Descartáveis';
      case ProductCategoriesEnum.estetica:
        return 'Estética';
      case ProductCategoriesEnum.ortodontia:
        return 'Ortodontia';
      case ProductCategoriesEnum.endodontia:
        return 'Endodontia';
      case ProductCategoriesEnum.perifericos:
        return 'Periféricos';
      case ProductCategoriesEnum.moldagem:
        return 'Moldagem';
      case ProductCategoriesEnum.protese:
        return 'Prótese';
      case ProductCategoriesEnum.cimentos:
        return 'Cimentos';
      case ProductCategoriesEnum.instrumentos:
        return 'Instrumentos';
      case ProductCategoriesEnum.cirurgia:
        return 'Cirurgia';
      case ProductCategoriesEnum.radiologia:
        return 'Radiologia';
      default:
        return 'Outro';
    }
  }
}
