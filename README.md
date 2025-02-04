# Prueba técnica RappiPay
## Prueba técnica Flutter developer - RappiPay

Proyecto realizado para la prueba técnica en RappiPay, el proyecto consiste en consumir la API de [TMDB](https://developers.themoviedb.org/), utilizando como gestor de estados [Riverpod](https://pub.dev/packages/flutter_riverpod), para la gestion de rutas y navegación se utilizo [Fluro](https://pub.dev/packages/fluro) y para la creación de modelos se utilizó [Freezed](https://pub.dev/packages/freezed).💻

## Características
El proyecto se compone principalmente por 2 features principales:
- Movies (Peliculas): Lista las peliculas mas populares y mejores rankeadas.
- Series (Series): Lista las series de TV mas populares y mejores rankeadas.


## Arquitectura
Arquitectura utilizada en el app:

![Arquitectura](assets/architecture.png)

## Instalación
Para la instalación del proyecto debemos tener en cuenta las versiones de [Flutter](https://flutter.dev/), para este proyecto se utilizo Flutter 3.27.3 y Dart 3.6.1.
Importante instalar la depedencia de build_runner para generar los modelos con freezed.

Clonar el repositorio:

```sh
git clone https://github.com/Sebastian-Beltran/movies-series-rappipay.git
```

Navegar al directorio del proyecto:

```sh
cd movies-series-rappipay
```

Instalar dependencias:

```sh
flutter pub get
```

Importante tambien generar los modelos con el comando:

```sh
dart run build_runner build —delete-conflicting-outputs
```

Para correr el proyecto se debe correr el siguiente comando:

```sh
flutter run
```

## Tecnologías Usadas
- [Flutter](https://flutter.dev/) - Framework de desarrollo.
- [Dart](https://dart.dev/) - Lenguaje de programación.
- [Riverpod](https://pub.dev/packages/flutter_riverpod) - Gestor de estados.
- [Fluro](https://pub.dev/packages/fluro) - Base de datos local.
- [Freezed](https://pub.dev/packages/freezed) - Base de datos local.

## Autor
- **Sebastian Beltran Gonzalez** - [GitHub](https://github.com/Sebastian-Beltran)
