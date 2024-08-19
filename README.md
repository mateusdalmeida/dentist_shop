# Corelab challenge

Este repositorio contem o codigo fonte do desafio da CoreLab

## Observações

1. Para navegação foi utilizado o BottomNavigationBar em telas verticais e NavigationRail na horizontal

2. Para manutenção das telas em modo "keep alive" foi utilizado o widget IndexedStack que mantem o estado dos widgets, porem os retira da arvore de widgets

3. As telas de Home e Categorias contem um sistema de navegação propria, isso em conjunto com IndexedStack permite utilizar seus atributos e funções sem remover a barra de navegação

4. O não uso de Provider ou similares para o SearchNotifier foi uma decisão baseada no projeto, como a busca é uma tela que existe por si só e não compartilha o estado/dados com as demais, não existia a necessidade da manutenção de estados, logo não foi implementado.