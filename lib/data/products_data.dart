import 'package:dentist_shop/models/product_model.dart';

final List<ProductModel> products = [
  ProductModel(
    id: "[#e553a]",
    title: "Condicionador Ácido Fosfórico 37% - AllPrime",
    value: 2990,
    image:
        "https://cdn.dentalspeed.com/produtos/550/condicionador-acido-allprime-12474.jpg",
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now(),
    category: ProductCategoriesEnum.moldagem,
  ),
  ProductModel(
    id: "[#f2fdc]",
    title: "Condicionador Ácido Fosfórico 37% - 10 unidades - AllPrime",
    value: 30000,
    image:
        "https://cdn.dentalspeed.com/produtos/550/condicionador-acido-allprime-12474.jpg",
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now(),
    discount: 10.0,
    category: ProductCategoriesEnum.moldagem,
  ),
  ProductModel(
    id: "[#4c078]",
    title: "Máscara Cirúrgica Descartável Descarpack Com 50 Unidades",
    value: 1040,
    image:
        "https://cdn.dentalspeed.com/produtos/550/mascara-descartavel-com-tiras-descarpack-ds-12683a-1.jpg",
    status: ProductStatusEnum.usado,
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    discount: 5.5,
    category: ProductCategoriesEnum.descartaveis,
  ),
  ProductModel(
    id: "[#a44f6]",
    title: "Luvas de Látex Tamanho G - 100 Unidades",
    value: 1500,
    image:
        "https://cdn.dentalspeed.com/produtos/550/luva-latex-para-procedimento-com-po-allprime-26707.jpg",
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 2)),
    category: ProductCategoriesEnum.descartaveis,
  ),
  ProductModel(
    id: "[#b8627]",
    title: "Espátula para Modelagem de Resina - Kit com 5 Peças",
    value: 850,
    image:
        "https://cdn.dentalspeed.com/produtos/550/espatula-p-resina-n-1-rosa-ice-ds-ice14380c-001.jpg",
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    category: ProductCategoriesEnum.moldagem,
  ),
  ProductModel(
    id: "[#0394b]",
    title: "Desinfetante para Superfícies - 500ml",
    value: 620,
    image:
        "https://cdn.dentalspeed.com/produtos/550/desinfetante-hospitalar-pronto-uso-medcare-medcare-dental-speed-med33773a.jpg",
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 5)),
    discount: 15.0,
    category: ProductCategoriesEnum.biosseguranca,
  ),
  ProductModel(
    id: "[#017bf]",
    title: "Cimento de Ionômero de Vidro - 15g",
    value: 2590,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 10)),
    category: ProductCategoriesEnum.cimentos,
  ),
  ProductModel(
    id: "[#2cac5]",
    title: "Protetor de Boca Descartável - Pacote com 100 Unidades",
    value: 1800,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 7)),
    discount: 15.0,
    category: ProductCategoriesEnum.descartaveis,
  ),
  ProductModel(
    id: "[#5ac22]",
    title: "Equipamento de Clareamento Dental - 1 Unidade",
    value: 75000,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
    category: ProductCategoriesEnum.estetica,
  ),
  ProductModel(
    id: "[#bf43b]",
    title: "Brocas Dentárias - Kit com 10 Peças",
    value: 2200,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 12)),
    category: ProductCategoriesEnum.instrumentos,
  ),
  ProductModel(
    id: "[#c5065]",
    title: "Sonda Periodontal - 1 Unidade",
    value: 450,
    status: ProductStatusEnum.usado,
    createdAt: DateTime.now().subtract(const Duration(days: 8)),
    discount: 20.0,
    category: ProductCategoriesEnum.endodontia,
  ),
  ProductModel(
    id: "[#7499c]",
    title: "Aspirador de Secreção - 1 Unidade",
    value: 15500,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 20)),
    category: ProductCategoriesEnum.instrumentos,
  ),
  ProductModel(
    id: "[#1ead1]",
    title: "Gel Desinfetante para Mãos - 250ml",
    value: 350,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 3)),
    discount: 5.0,
    category: ProductCategoriesEnum.biosseguranca,
  ),
  ProductModel(
    id: "[#6f213]",
    title: "Luz LED para Clareamento Dental - 1 Unidade",
    value: 12000,
    status: ProductStatusEnum.usado,
    createdAt: DateTime.now().subtract(const Duration(days: 25)),
    category: ProductCategoriesEnum.estetica,
  ),
  ProductModel(
    id: "[#dba67]",
    title: "Escova de Profilaxia - Kit com 10 Unidades",
    value: 950,
    status: ProductStatusEnum.novo,
    createdAt: DateTime.now().subtract(const Duration(days: 14)),
    category: ProductCategoriesEnum.instrumentos,
  ),
];